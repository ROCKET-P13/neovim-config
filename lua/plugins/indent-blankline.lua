local M = {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
}

function M.config()
	local icons = require("config.icons")

	require("ibl").setup({
		exclude = {
			buftypes = { "terminal", "nofile" },
			filetypes = {
				"help",
				"startify",
				"dashboard",
				"lazy",
				"neogitstatus",
				"NvimTree",
				"Trouble",
				"text",
			},
		},
		indent = { char = icons.ui.LineMiddle },
		whitespace = { remove_blankline_trail = true },
		scope = { enabled = false },
	})
end

return M
