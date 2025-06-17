local M = {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/playground",
	},
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"vimdoc",
				"jsonc",
				"javascript",
				"typescript",
				"c",
				"c_sharp",
				"lua",
				"rust",
				"jsdoc",
				"bash",
				"query",
			},
			sync_install = false,
			auto_install = false,
			indent = {
				enable = false,
			},
			highlight = {
				enable = true,
				use_languagetree = false,
				additional_vim_regex_highlighting = false,
			},
		})
	end,
}

return M
