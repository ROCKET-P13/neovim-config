-- Per-buffer highlighting: sends the buffer (throttled) to the tokenizer, which
-- keeps per-buffer grammar state and replies with only the contiguous line range
-- an edit could have changed. We repaint just that range, leaving extmarks on
-- unchanged lines in place (they auto-track text edits), which avoids the flicker
-- and cost of clearing and repainting the whole buffer on every keystroke.
--
-- Updates are throttled (leading + trailing) rather than debounced, so colors
-- refresh periodically *while* typing instead of only after a pause. This keeps
-- an identifier being typed (e.g. "const testing") at its real color promptly
-- rather than leaving the new characters uncolored until the user stops.

local theme = require("textmate.theme")

local M = {}

-- buf -> { ns, scope_name, attached, timer, last_run, inflight, dirty, tick }
local state = {}

local config = {
	client = nil,
	throttle_ms = 40,
	max_lines = 5000,
}

--- @param opts { client: table, throttle_ms: number, max_lines: number }
function M.setup(opts)
	config.client = opts.client
	config.throttle_ms = opts.throttle_ms or config.throttle_ms
	config.max_lines = opts.max_lines or config.max_lines
end

-- Repaint the changed line range [start, stop). `tokens[i]` holds the tokens for
-- line `start + i - 1`. Only this window's extmarks are cleared; highlights on
-- lines outside it are left untouched.
local function paint_range(buf, ns, start, stop, tokens)
	if not vim.api.nvim_buf_is_valid(buf) then
		return
	end
	vim.api.nvim_buf_clear_namespace(buf, ns, start, stop)
	for i, line_tokens in ipairs(tokens) do
		local lnum = start + i - 1
		for _, tok in ipairs(line_tokens) do
			local group = theme.group(tok.c, tok.y)
			if group and tok.e > tok.s then
				-- Buffer may have shrunk under us between request and paint;
				-- a bad range raises, so swallow it and let the next pass fix it.
				-- Above treesitter's default extmark priority (100) so our
				-- highlight wins even if treesitter remains active on the buffer.
				-- end_right_gravity: characters typed at a token's end extend its
				-- highlight (e.g. typing "con" stays the identifier color) instead
				-- of rendering uncolored until the next re-tokenize reclassifies it.
				pcall(vim.api.nvim_buf_set_extmark, buf, ns, lnum, tok.s, {
					end_col = tok.e,
					hl_group = group,
					priority = 200,
					end_right_gravity = true,
				})
			end
		end
	end
end

local schedule

-- At most one tokenize request is outstanding per buffer. This keeps the
-- tokenizer's cached base in lockstep with what we last painted, so its
-- incremental diffs stay valid. Edits arriving while a request is in flight set
-- `dirty`, triggering a follow-up pass once the current one returns.
local function send_tokenize(buf)
	local st = state[buf]
	if not st or not st.attached or not vim.api.nvim_buf_is_valid(buf) then
		return
	end
	local line_count = vim.api.nvim_buf_line_count(buf)
	if line_count > config.max_lines then
		-- Drop any cached base so re-enabling below the limit re-tokenizes cleanly.
		config.client:drop(buf)
		return
	end
	if st.inflight then
		st.dirty = true
		return
	end
	local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
	st.inflight = true
	st.dirty = false
	st.tick = vim.api.nvim_buf_get_changedtick(buf)
	config.client:tokenize(buf, st.scope_name, lines, function(err, result)
		vim.schedule(function()
			local s = state[buf]
			if not s or not s.attached then
				return
			end
			s.inflight = false
			if err then
				vim.notify("[textmate] " .. err, vim.log.levels.WARN)
			elseif not vim.api.nvim_buf_is_valid(buf) then
				return
			elseif vim.api.nvim_buf_get_changedtick(buf) == s.tick then
				paint_range(buf, s.ns, result.start, result.stop, result.tokens)
			else
				-- The buffer changed during the request, so the result's line
				-- numbers no longer line up and the cached base is stale. Discard
				-- it and force the next pass to re-tokenize from scratch.
				config.client:drop(buf)
				s.dirty = true
			end
			if s.dirty then
				s.dirty = false
				schedule(buf)
			end
		end)
	end)
end

local function run(buf)
	local st = state[buf]
	if not st then
		return
	end
	st.last_run = vim.uv.now()
	vim.schedule(function()
		send_tokenize(buf)
	end)
end

-- Leading + trailing throttle: the first change runs immediately, further
-- changes within the window are coalesced into a single trailing run, so a
-- continuous typing burst still refreshes about once per throttle window.
function schedule(buf)
	local st = state[buf]
	if not st then
		return
	end
	if st.timer then
		return
	end
	local elapsed = vim.uv.now() - (st.last_run or 0)
	if elapsed >= config.throttle_ms then
		run(buf)
		return
	end
	local timer = vim.uv.new_timer()
	st.timer = timer
	timer:start(config.throttle_ms - elapsed, 0, function()
		timer:stop()
		timer:close()
		if state[buf] then
			state[buf].timer = nil
		end
		run(buf)
	end)
end

--- Attach highlighting to a buffer for the given grammar scope.
function M.attach(buf, scope_name)
	if state[buf] and state[buf].attached then
		return
	end
	local ns = vim.api.nvim_create_namespace("textmate:" .. buf)
	state[buf] = { ns = ns, scope_name = scope_name, attached = true }

	vim.api.nvim_buf_attach(buf, false, {
		on_lines = function()
			if not state[buf] or not state[buf].attached then
				return true -- detach the callback
			end
			schedule(buf)
		end,
		on_detach = function()
			M.detach(buf)
		end,
	})

	config.client:when_ready(function()
		vim.schedule(function()
			send_tokenize(buf)
		end)
	end)
end

--- Detach highlighting and clear extmarks.
function M.detach(buf)
	local st = state[buf]
	if not st then
		return
	end
	st.attached = false
	if st.timer then
		st.timer:stop()
		st.timer:close()
		st.timer = nil
	end
	config.client:drop(buf)
	if vim.api.nvim_buf_is_valid(buf) then
		vim.api.nvim_buf_clear_namespace(buf, st.ns, 0, -1)
	end
	state[buf] = nil
end

function M.is_attached(buf)
	return state[buf] ~= nil and state[buf].attached
end

return M
