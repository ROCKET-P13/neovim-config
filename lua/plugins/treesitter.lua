local M = {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
}

function M.config()
	require("nvim-treesitter.configs").setup({
		ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "javascript" },
		highlight = { enable = true },
		indent = { enable = false },
	})
end

return M
