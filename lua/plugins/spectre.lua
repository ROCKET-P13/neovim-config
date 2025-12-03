local M = {
	"nvim-pack/nvim-spectre",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", opts = {} },
	},
	config = function()
		vim.keymap.set("n", "<C-f>", '<cmd>lua require("spectre").toggle()<CR>', {
			desc = "Toggle Spectre",
		})
		vim.keymap.set("n", "<leader>sw", '<cmd>lua require("spectre").open_file_search({select_word=false})<CR>', {
			desc = "Search current word",
		})
		vim.keymap.set("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
			desc = "Search current word",
		})
		vim.keymap.set("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
			desc = "Search word on current file",
		})
		vim.keymap.set("n", "<leader>f", '<cmd>lua require("spectre").open_file_search({select_word=false})<CR>', {
			desc = "Search on current file",
		})
	end,
}

return M
