local M = {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = true,
}

function M.config()
	require("toggleterm").setup({
		open_mapping = [[<C-j>]],
		direction = "float",
	})
end

return M
