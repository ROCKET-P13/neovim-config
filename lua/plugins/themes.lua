local M = {
	"ellisonleao/gruvbox.nvim",
}

function M.config()
	vim.o.background = "dark"
	vim.cmd([[colorscheme gruvbox]])
end

return M
