return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	version = "*",
	lazy = false,
	opts = {
		completion = {
			list = {
				selection = {
					preselect = function(ctx)
						return ctx.mode ~= "cmdline"
					end,
					auto_insert = false,
				},
				max_items = 7,
			},
			documentation = {
				treesitter_highlighting = false,
			},
			accept = {
				resolve_timeout_ms = 50,
				auto_brackets = {
					enabled = false,
				},
			},
		},
		keymap = {
			preset = "default",
			["<CR>"] = { "accept", "fallback" },
		},
		appearance = {},
		signature = {
			enabled = false,
		},
		sources = {
			default = {
				"lsp",
				"snippets",
				"path",
			},
			providers = {
				lsp = {
					timeout_ms = 50,
				},
			},
		},
	},
}
