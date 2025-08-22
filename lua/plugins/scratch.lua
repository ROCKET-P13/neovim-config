local M = {
	"folke/snacks.nvim",
	opts = {
		scratch = {
			ft = function()
				if vim.bo.buftype == "" and vim.bo.filetype ~= "" then
					return vim.bo.filetype
				end
				return "markdown"
			end,
		},
	},
	keys = {
		{
			"<leader>.",
			function()
				local snacks = require("snacks")
				snacks.scratch()
			end,
			desc = "Toggle Scratch Buffer",
		},
	},
}

return M
