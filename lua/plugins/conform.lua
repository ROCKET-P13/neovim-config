return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				-- javascript = { "prettierd" },
				-- typescript = { "prettierd" },
				-- javascriptreact = { "prettierd" },
				-- typescriptreact = { "prettierd" },
				-- css = { "prettierd" },
				-- html = { "prettierd" },
				-- json = { "prettierd" },
				-- markdown = { "prettierd" },
				lua = { "stylua" },
			},
			-- since prettierd isn't configured for js files, we will automatically fall back to the eslint LSP.
			format_on_save = {
				-- prefer conform formatters for file types (immediately falls back to LSP if a formatter doesn't exist for file type so no lag)
				lsp_fallback = true,
				async = false,
				timeout_ms = 200,

				-- prefer LSP formatting for file types
				-- lsp_format = "fallback",
				-- timeout_ms = 200,

				-- messing around here
				-- lsp_format = "first",
				-- filter = function(client)
				-- 	if client.name == "eslint" then
				-- 		print("linting yo")
				-- 	end
				-- 	return client.name == "eslint"
				-- end,
			},
		})
		vim.keymap.set("n", "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 200,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
