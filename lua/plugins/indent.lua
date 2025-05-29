local M = {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	---@module "ibl"
	opts = {},
	config = function()
		local icons = require("config.icons")
		-- vim.api.nvim_set_hl(0, "IblIndent", { fg = "#17191A", nocombine = true })

		require("ibl").setup({
			indent = {
				char = icons.ui.LineLeft,
			},
			scope = {
				enabled = false,
				show_start = false,
				show_end = false,
			},
		})
	end,
}

return M
