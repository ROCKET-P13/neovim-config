local M = {
	"neovim/nvim-lspconfig",
	dependencies = {
		"folke/neodev.nvim",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "antosha417/nvim-lsp-file-operations", config = true }, -- modify imports when files have been renamed
		{ "folke/neodev.nvim", opts = {} }, -- add improved lua lsp functionality
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("neodev").setup({})

		local capabilities = nil

		local lspconfig = require("lspconfig")

		local servers = {
			bashls = true,
			lua_ls = {
				server_capabilities = {
					semanticTokensProvider = vim.NIL,
				},
				settings = {
					Lua = {
						diagnostics = {
							globals = {
								"vim",
							},
						},
					},
				},
			},
			cssls = true,
			eslint = true,
			ts_ls = {
				server_capabilities = {
					documentFormattingProvider = false,
					semanticTokensProvider = vim.NIL,
				},
			},
		}

		local servers_to_install = vim.tbl_filter(function(key)
			local t = servers[key]
			if type(t) == "table" then
				return not t.manual_install
			else
				return t
			end
		end, vim.tbl_keys(servers))
		require("mason").setup()
		local ensure_installed = {
			"stylua",
			"lua_ls",
			"ts_ls",
			"eslint",
			"html",
		}

		vim.list_extend(ensure_installed, servers_to_install)
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		vim.diagnostic.config({
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})

		for name, config in pairs(servers) do
			if config == true then
				config = {}
			end
			config = vim.tbl_deep_extend("force", {}, {
				capabilities = capabilities,
			}, config)

			lspconfig[name].setup(config)
		end

		local disable_semantic_tokens = {
			lua = true,
			javascript = true,
			typescript = true,
		}

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(event)
				local bufnr = event.buf
				local client = vim.lsp.get_client_by_id(event.data.client_id) or { name = "" }
				local opts = { buffer = bufnr, silent = true }

				opts.desc = "LSP: Show definitions"
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

				opts.desc = "LSP: Go to declaration"
				vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

				opts.desc = "LSP: Go to declaration"
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

				opts.desc = "LSP: Show documentation for what is under cursor"
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

				opts.desc = "LSP: Show implementations"
				vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

				opts.desc = "LSP: Show type definitions"
				vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

				opts.desc = "LSP: See available code actions"
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "LSP: Smart rename"
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "LSP: View line diagnostics"
				vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts) -- view diagnostics for line

				opts.desc = "LSP: View buffer diagnostics"
				vim.keymap.set("n", "<leader>vD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- view  diagnostics for file

				opts.desc = "LSP: Go to previous diagnostic"
				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

				opts.desc = "LSP: Go to next diagnostic"
				vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

				opts.desc = "LSP: Restart LSP"
				vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

				local filetype = vim.bo[bufnr].filetype
				if disable_semantic_tokens[filetype] then
					client.server_capabilities.semanticTokensProvider = nil
				end

				if client.name == "ts_ls" then
					client.server_capabilities.documentFormattingProvider = false
				end
			end,
		})

		local icons = require("config.icons")
		local severity = vim.diagnostic.severity

		vim.diagnostic.config({
			signs = {
				active = true,
				values = {
					{ name = "DiagnosticSignError", text = icons.diagnostics.Error },
					{ name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
					{ name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
					{ name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
				},
				text = {
					[severity.ERROR] = icons.diagnostics.Error,
					[severity.WARN] = icons.diagnostics.Warning,
					[severity.HINT] = icons.diagnostics.Hint,
					[severity.INFO] = icons.diagnostics.Information,
				},
				texthl = {
					[severity.ERROR] = "DiagnosticSignError",
					[severity.WARN] = "DiagnosticSignWarn",
					[severity.HINT] = "DiagnosticSignHint",
					[severity.INFO] = "DiagnosticSignInfo",
				},
				numhl = {
					[severity.ERROR] = "DiagnosticSignError",
					[severity.WARN] = "DiagnosticSignWarn",
					[severity.HINT] = "DiagnosticSignHint",
					[severity.INFO] = "DiagnosticSignInfo",
				},
			},
			virtual_text = false,
			update_in_insert = false,
			underline = true,
			severity_sort = true,
			float = {
				focusable = true,
				style = "minimal",
				border = "rounded",
				header = "",
				prefix = "",
			},
		})
	end,
}

return M
