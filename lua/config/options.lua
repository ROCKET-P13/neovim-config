vim.opt.scrolloff = 10
vim.opt.number = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.fixendofline = false
vim.opt.ignorecase = true
vim.opt.smartcase = true 
vim.opt.splitbelow = true 
vim.opt.splitright = true 
vim.opt.swapfile = false 
vim.opt.termguicolors = true 
vim.opt.timeoutlen = 1000 
vim.opt.undofile = true 
vim.opt.updatetime = 100 
vim.opt.laststatus = 3
vim.opt.showcmd = false
vim.opt.ruler = false
vim.opt.title = false
vim.opt.completeopt = { "menu", "menuone", "noselect" } 
vim.opt.fillchars = vim.opt.fillchars + "eob: "
vim.opt.fillchars:append({
	stl = " ",
})

vim.cmd("set signcolumn=yes")

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

