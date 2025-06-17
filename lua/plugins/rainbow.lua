local M = {
	"HiPhish/rainbow-delimiters.nvim",
	config = function()
		---@type rainbow_delimiters.config
		vim.g.rainbow_delimiters = {
			strategy = {
				[""] = "rainbow-delimiters.strategy.global",
				vim = "rainbow-delimiters.strategy.local",
			},
			query = {
				[""] = "rainbow-delimiters",
				lua = "rainbow-blocks",
			},
			priority = {
				[""] = 110,
				lua = 210,
			},
			highlight = {
				"RainbowDelimiterRed",
				"RainbowDelimiterYellow",
				"RainbowDelimiterBlue",
				"RainbowDelimiterOrange",
				"RainbowDelimiterGreen",
				"RainbowDelimiterViolet",
				"RainbowDelimiterCyan",
			},
		}

		-- Define the exact colors to match your example
		vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { link = "GruvboxYellow" }) -- Gold/yellow
		vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { link = "GruvboxCyan" }) -- Cyan
		vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { link = "GruvboxBlue" }) -- Blue
		vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { link = "GruvboxOrange" }) -- Orange
		vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { link = "GruvboxGreen" }) -- Green
		vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { link = "GruvboxViolet" }) -- Purple/violet
		vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { link = "GruvboxRed" }) -- Red
	end,
}

return {}
