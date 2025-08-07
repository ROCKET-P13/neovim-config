local M = {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		{
			"nvim-telescope/telescope-frecency.nvim",
			version = "*",
		},
	},
	config = function()
		local actions = require("telescope.actions")

		require("telescope").setup({
			defaults = {
				path_display = { "smart" },
				layout_strategy = "horizontal",
				-- show preview no matter the terminal column width
				layout_config = {
					prompt_position = "top",
					horizontal = {
						preview_cutoff = 0,
						height = 30,
						width = 100,
					},
				},
				sorting_strategy = "ascending",
				shorter_path = true,
				initial_mode = "insert",
				selection_strategy = "reset",
				color_devicons = true,
				preview = false,
			},
			mappings = {
				n = {
					["<esc>"] = actions.close,
					["q"] = actions.close,
					["<C-q>"] = function(prompt_bufnr)
						actions.smart_send_to_qflist(prompt_bufnr)
						actions.open_qflist(prompt_bufnr)
					end,
				},
				i = {
					["<C-q>"] = function(prompt_bufnr)
						actions.smart_send_to_qflist(prompt_bufnr)
						actions.open_qflist(prompt_bufnr)
					end,
				},
			},
			pickers = {
				find_files = {},
				git_status = {
					preview = true,
				},
			},
			extensions = {
				fzf = {},
				frecency = {},
			},
		})

		require("telescope").load_extension("fzf")
		require("telescope").load_extension("frecency")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<C-p>", function()
			require("telescope").extensions.frecency.frecency({
				workspace = "CWD",
			})
		end)

		vim.keymap.set("n", "<C-g>", builtin.git_status, {})
		vim.keymap.set("n", "<C-b>", builtin.buffers, {})
	end,
}

return M
