local M = {
	"stevearc/conform.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"mason-org/mason.nvim",
			opts = {},
		},
	},
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
			},
		})
	end,
}

return M
