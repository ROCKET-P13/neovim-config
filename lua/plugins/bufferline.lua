local M = {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
}

function M.config()
	require("bufferline").setup({
		options = {
			close_command = "Bdelete",
			show_close_icon = false,
			show_buffer_close_icons = true,
			offsets = {
				{
					filetype = "NvimTree",
					highlight = "Directory",
					separator = true,
				},
			},
			hover = {
				enabled = true,
				delay = 10,
				reveal = { "close" },
			},
			separator_style = "thick",
		},
	})

	vim.keymap.set(
		"n",
		"<C-Left>",
		":BufferLineCyclePrev<cr>",
		{ desc = "Cycle through buffers left. (Mnemonic: overlaps with jumplist navigation <C-i>)" }
	)
	vim.keymap.set(
		"n",
		"<C-Right>",
		":BufferLineCycleNext<cr>",
		{ desc = "Cycle through buffers right. (Mnemonic: overlaps with jumplist navigation <C-o>)" }
	)
end

return M
