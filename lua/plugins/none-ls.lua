local M = {
	'nvimtools/none-ls.nvim',
	dependencies = {
		'nvimtools/none-ls-extras.nvim',
	}
}

function M.config()
	local null_ls = require("null-ls")
	local formatting = null_ls.builtins.formatting
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	null_ls.setup({
		diagnostics_format = "[#{c}] #{m} (#{s})",
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ async = false })
					end,
				})
			end
		end,
		diagnostic_config = {
			underline = true,
			signs = true,
		},
		sources = {
			require("none-ls.diagnostics.eslint_d"),
			formatting.stylua,
		},
	})
end

return M
