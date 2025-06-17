return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"folke/neodev.nvim",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			"stevearc/conform.nvim",
			"b0o/SchemaStore.nvim",
		},
		config = function()
			require("neodev").setup({})

			local capabilities = nil
			if pcall(require, "cmp_nvim_lsp") then
				capabilities = require("cmp_nvim_lsp").default_capabilities()
			end

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
				eslint = {
					settings = {
						codeActionsOnSave = {
							enable = false,
						},
					},
				},
				ts_ls = {
					server_capabilities = {
						documentFormattingProvider = false,
						semanticTokensProvider = vim.NIL,
					},
				},
				jsonls = {
					settings = {
						json = {
							schemas = require("schemastore").json.schemas(),
							validate = { enable = true },
						},
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
				"eslint",
				"ts_ls",
				"jsonls",
			}

			vim.list_extend(ensure_installed, servers_to_install)
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

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
			}

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local bufnr = args.buf
					local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

					local settings = servers[client.name]
					if type(settings) ~= "table" then
						settings = {}
					end

					local builtin = require("telescope.builtin")

					vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
					vim.keymap.set("n", "gd", builtin.lsp_definitions, { buffer = 0 })
					vim.keymap.set("n", "gr", builtin.lsp_references, { buffer = 0 })
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
					vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
					vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })

					vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, { buffer = 0 })

					local filetype = vim.bo[bufnr].filetype
					if disable_semantic_tokens[filetype] then
						client.server_capabilities.semanticTokensProvider = nil
					end

					if settings.server_capabilities then
						for k, v in pairs(settings.server_capabilities) do
							if v == vim.NIL then
								v = nil
							end

							client.server_capabilities[k] = v
						end
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
					source = "always",
					header = "",
					prefix = "",
				},
			})

			-- Show diagnostics in a floating window when cursor is idle
			vim.api.nvim_create_autocmd("CursorHold", {
				callback = function()
					vim.diagnostic.open_float(nil, {
						focusable = false,
						close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
						border = "rounded",
						source = "always",
						prefix = "",
						scope = "cursor",
					})
				end,
			})

			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "eslint" },
				},
				log_level = vim.log.levels.DEBUG,
			})

			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					require("conform").format({
						bufnr = args.buf,
					})
				end,
			})
		end,
	},
}
