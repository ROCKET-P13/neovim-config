vim.opt.number = true
vim.opt.relativenumber = false

vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ff9e64", bold = true })

vim.opt.startofline = true

vim.opt.timeout = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.list = false
vim.opt.smartindent = true

vim.opt.swapfile = false

vim.opt.wrap = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"

vim.opt.backspace = "indent,eol,start"

vim.opt.clipboard:append("unnamedplus")

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.fixendofline = false

vim.g.mapleader = " "
-- force CRLF line endings for all new files
vim.opt.fileformats = "dos,unix"
vim.opt.fileformat = "dos"

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
	callback = function()
		if vim.bo.buftype == "" then
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

local esc = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)
vim.fn.setreg("t", "ywothrow new Error(JSON.stringify({ " .. esc .. "pa }));" .. esc)
vim.fn.setreg("l", "ywoconsole.log(JSON.stringify({ " .. esc .. "pa }));" .. esc)
