local M = {
	"numToStr/Comment.nvim",
}

function M.config()
	require("Comment").setup({
		toggler = {
			block = "<C-_>",
		},
		opleader = {
			block = "<C-_>",
		},
	})
end

return M
