return {
	"neovim/nvim-lspconfig",
	events = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"folke/neodev.nvim",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"b0o/SchemaStore.nvim",
	},
}
