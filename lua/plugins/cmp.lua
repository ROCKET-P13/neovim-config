local M = {
	"hrsh7th/nvim-cmp",
	--[[ event = "InsertEnter", ]]
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"onsails/lspkind.nvim",
	},
}

function M.config()
	local cmp = require("cmp")
	local luasnip = require("luasnip")

	local is_whitespace = function()
		local col = vim.fn.col(".") - 1
		local line = vim.fn.getline(".")
		local char_under_cursor = string.sub(line, col, col)

		if col == 0 or string.match(char_under_cursor, "%s") then
			return true
		else
			return false
		end
	end

	local is_comment = function()
		local context = require("cmp.config.context")
		return context.in_treesitter_capture("comment") == true or context.in_syntax_group("Comment")
	end

	cmp.setup({
		enabled = function()
			if is_comment() or is_whitespace() then
				return false
			else
				return true
			end
		end,
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		view = {
			docs = { auto_open = false },
		},
		window = {
			completion = cmp.config.window.bordered({ scrolloff = 4 }),
		},
		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<CR>"] = cmp.mapping.confirm(),
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "path" },
			{ name = "buffer" },
		}),
		completion = {
			completeopt = "menu,menuone,noinsert",
			keyword_length = 1,
		},
		performance = {
			max_view_entries = 5,
			debounce = 10,
			confirm_resolve_timeout = 80,
			throttle = 0,
			fetching_timeout = 80,
			async_budget = 10,
		},
		sorting = {
			priority_weight = 2,
			comparators = {
				cmp.config.compare.offset,
				cmp.config.compare.scopes,
				cmp.config.compare.exact,
				cmp.config.compare.score,
				cmp.config.compare.recently_used,
				cmp.config.compare.locality,
				cmp.config.compare.kind,
				cmp.config.compare.sort_text,
				cmp.config.compare.length,
				cmp.config.compare.order,
			},
		},
	})

	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	require("lspconfig")["lua_ls"].setup({
		capabilities = capabilities,
	})
end

return M
