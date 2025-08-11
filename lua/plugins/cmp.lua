-- setup autocompletion
return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			-- install jsregexp (optional!).
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"onsails/lspkind.nvim", -- vs-code like pictograms
	},
	config = function()
		local cmp = require("cmp")

		local luasnip = require("luasnip")

		luasnip.add_snippets("javascript", {
			luasnip.snippet("tne", {
				luasnip.text_node("throw new Error("),
				luasnip.insert_node(1),
				luasnip.text_node(")"),
			}),
		})

		luasnip.add_snippets("javascript", {
			luasnip.snippet("jsf", {
				luasnip.text_node("JSON.stringify("),
				luasnip.insert_node(1),
				luasnip.text_node(")"),
			}),
		})

		luasnip.add_snippets("javascript", {
			luasnip.snippet("sn_beforeEach", {
				luasnip.text_node("beforeEach(() => {"),
				luasnip.insert_node(1),
				luasnip.text_node("});"),
			}),
		})

		luasnip.add_snippets("javascript", {
			luasnip.snippet("cl", {
				luasnip.text_node("console.log("),
				luasnip.insert_node(1),
				luasnip.text_node(")"),
			}),
		})

		luasnip.add_snippets("javascript", {
			luasnip.snippet("ci", {
				luasnip.text_node("console.info("),
				luasnip.insert_node(1),
				luasnip.text_node(")"),
			}),
		})

		local lspkind = require("lspkind")

		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			window = {
				documentation = cmp.config.disable,
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = "luasnip" },
				{ name = "nvim_lsp" }, -- source suggestions from lsp
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
			}),
			performance = {
				max_view_entries = 10,
			},
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
		})
	end,
}
