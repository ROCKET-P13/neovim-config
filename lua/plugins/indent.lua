local M = {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		require("ibl").setup({
			indent = {
				char = "│",
			},
			scope = {
				enabled = false,
			},
		})
	end,
}

return {}
