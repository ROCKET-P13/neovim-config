local M = {
	"ellisonleao/gruvbox.nvim",
}

function M.config()
	require("gruvbox").setup({
		undercurl = true,
		contrast = "hard",
		italic = {
			strings = false,
			emphasis = true,
			comments = true,
			operators = false,
			folds = true,
		},
	})
	vim.o.background = "dark"
	vim.cmd([[colorscheme gruvbox]])
end

return M
