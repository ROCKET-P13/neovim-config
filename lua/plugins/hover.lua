local M = {
	"lewis6991/hover.nvim",
}

function M.config()
	require("hover").setup({
		init = function()
			require("hover.providers.lsp")
			require("hover.providers.diagnostic")
		end,
		preview_opts = {
			border = "single",
		},
		title = true,
		mouse_providers = {
			"LSP",
		},
		mouse_delay = 800,
	})
	vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })

	vim.keymap.set("n", "<MouseMove>", require("hover").hover_mouse, { desc = "hover.nvim (mouse)" })
	vim.o.mousemoveevent = true
end

--[[ return M ]]
return {}
