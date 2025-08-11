vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = true -- highlight current line number (and enable the below 2 options to only highlight number)
vim.opt.cursorlineopt = "number"
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ff9e64", bold = true })

vim.opt.startofline = true -- gg defaults to column 1 (among other things)

-- vim.opt.hlsearch = false -- controls search results highlighting
vim.opt.timeout = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.list = false
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"

vim.opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

vim.opt.clipboard:append("unnamedplus") -- use system register as default register

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.fixendofline = false

vim.g.mapleader = " "

-- Remove auto comment continuation on newline
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- Automatically trigger buffer reload when underlyiiing disk file has changed
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
	callback = function()
		if vim.bo.buftype == "" then -- Only reload normal file buffers
			vim.cmd("checktime")
		end
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.keymap.set("n", "<C-l>", "<C-W>l")
vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set("n", "<C-j>", "<C-W>j")
vim.keymap.set("n", "<C-k>", "<C-W>k")
