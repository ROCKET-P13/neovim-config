local M = {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns
				vim.keymap.set("n", "]c", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true, buffer = bufnr })

				vim.keymap.set("n", "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true, buffer = bufnr })

				vim.keymap.set("n", "<leader>hs", gs.stage_hunk)
				vim.keymap.set("n", "<leader>hr", gs.reset_hunk)
				vim.keymap.set("n", "<leader>hp", gs.preview_hunk)
				vim.keymap.set("n", "<leader>hu", function()
					gs.undo_stage_hunk()
				end, { buffer = bufnr, desc = "Unstage hunk" })
			end,
		})
	end,
}

return M
