local M = {
	"saghen/blink.cmp",
	version = "1.*",
	config = function()
		require("blink.cmp").setup({
			keymap = {
				["<CR>"] = { "select_and_accept", "fallback" },
			},
			enabled = function()
				local node = vim.treesitter.get_node()
				local disabled = false
				disabled = disabled or (vim.tbl_contains({ "markdown" }, vim.bo.filetype))
				disabled = disabled or (vim.bo.buftype == "prompt")
				disabled = disabled or (node and string.find(node:type(), "comment"))
				disabled = disabled or (node and string.find(node:type(), "string"))

				return not disabled
			end,
			completion = {
				accept = {
					auto_brackets = {
						enabled = false,
					},
				},
				trigger = {
					show_on_blocked_trigger_characters = { " ", "\n", "\t" },
					show_on_x_blocked_trigger_characters = { "'", '"', "(" },
				},
				list = {
					max_items = 15,
					selection = {
						preselect = true,
						auto_insert = false,
					},
				},
			},
		})
	end,
}

return M
