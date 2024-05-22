local M = {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
	},
}

function M.config()
	local icons = require("config.icons")
	local actions = require("telescope.actions")
	local telescope = require("telescope")

	local builtin = require("telescope.builtin")
	vim.keymap.set("n", "<C-p>", builtin.find_files, {})
	vim.keymap.set("n", "<C-F>", builtin.live_grep, {})

	telescope.setup({
		defaults = {
			path_display = { "truncate" },
			shorter_path = true,
			layout_strategy = "horizontal",
			layout_config = { prompt_position = "top" },
			sorting_strategy = "ascending",
			prompt_prefix = icons.ui.Telescope .. " ",
			selection_caret = icons.ui.Forward .. " ",
			entry_prefix = "   ",
			initial_mode = "insert",
			selection_strategy = "reset",
			color_devicons = true,
		},
		mappings = {
			n = {
				["<esc>"] = actions.close,
				["q"] = actions.close,
			},
		},
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
			"--glob=!.git/",
		},
		extensions = {

			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		},
		pickers = {
			live_grep = {
				theme = "dropdown",
			},

			grep_string = {
				theme = "dropdown",
			},

			find_files = {
				theme = "dropdown",
				previewer = false,
			},

			planets = {
				show_pluto = true,
				show_moon = true,
			},

			colorscheme = {
				enable_preview = true,
			},

			lsp_references = {
				theme = "dropdown",
				initial_mode = "normal",
			},

			lsp_definitions = {
				theme = "dropdown",
				initial_mode = "normal",
			},

			lsp_declarations = {
				theme = "dropdown",
				initial_mode = "normal",
			},

			lsp_implementations = {
				theme = "dropdown",
				initial_mode = "normal",
			},
		},
	})
end

return M

