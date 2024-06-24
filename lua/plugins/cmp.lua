local M = {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"onsails/lspkind.nvim",
	},
}

function M.config()
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	-- local lspkind = require("lspkind")

	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		view = {
			docs = { auto_open = false },
		},
		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<CR>"] = cmp.mapping.confirm(),
		}),
		sources = cmp.config.sources({
			{ name = "buffer" },
			{ name = "nvim_lsp" },
			{ name = "path" },
		}),
		completion = { completeopt = "menu,menuone,noinsert" },
		performance = {
			max_view_entries = 7,
			debounce = 10,
			confirm_resolve_timeout = 80,
			throttle = 0,
			fetching_timeout = 80,
			async_budget = 10,
		},
	})
end

return M
