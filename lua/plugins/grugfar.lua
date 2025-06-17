local M = {
	"MagicDuck/grug-far.nvim",
	opts = { headerMaxWidth = 80 },
	cmd = "GrugFar",
	keys = {
		{
			"<leader>sr",
			function()
				local grug = require("grug-far")
				local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
				grug.open({
					transient = true,
					prefills = {
						filesFilter = ext and ext ~= "" and "*." .. ext or nil,
					},
				})
			end,
			mode = { "n", "v" },
			desc = "Search and Replace",
		},
	},
	config = function()
		vim.api.nvim_create_autocmd("filetype", {
			group = vim.api.nvim_create_augroup("grug-far-keybindings", { clear = true }),
			pattern = { "grug-far" },
			callback = function()
				vim.keymap.set("n", "<c-enter>", function()
					require("grug-far").get_instance(0):open_location()
					require("grug-far").get_instance(0):close()
				end, { buffer = true })
			end,
		})

		vim.api.nvim_create_autocmd("filetype", {
			group = vim.api.nvim_create_augroup("grug-far-keybindings", { clear = true }),
			pattern = { "grug-far" },
			callback = function()
				vim.keymap.set("n", "q", function()
					require("grug-far").get_instance(0):close()
				end, { buffer = true })
			end,
		})
	end,
}

return M
