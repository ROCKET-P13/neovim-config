local M = {
	"ellisonleao/gruvbox.nvim",
}

function M.config()
	require("gruvbox").setup({
		undercurl = true,
		contrast = "hard",
		palette_overrides = {
			dark1 = "#282828",
			dark3 = "#3c3836",
		},
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
