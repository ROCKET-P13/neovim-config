local M = {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
		require("gruvbox").setup({
			terminal_colors = true,
			undercurl = true,
			underline = true,
			bold = true,
			italic = {
				strings = false,
				emphasis = true,
				comments = true,
				operators = false,
				folds = false,
			},
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,
			inverse = true,
			contrast = "hard",
			dim_inactive = false,
			transparent_mode = false,
		})

		vim.api.nvim_set_hl(0, "@private_class_property", { link = "GruvboxBlue" })
		vim.api.nvim_set_hl(0, "@private_class_property_assignment", { link = "GruvboxBlue" })
		vim.api.nvim_set_hl(0, "@new_class_instance", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@class_name", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@class_extends", { link = "GruvboxFg1" })
		vim.api.nvim_set_hl(0, "@shorthand_property_identifier", { link = "GruvboxBlue" })
		vim.api.nvim_set_hl(0, "@property_reference", { link = "GruvboxBlue" })
		vim.api.nvim_set_hl(0, "@method_call", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@testingg", { link = "GruvboxYellow" })

		vim.api.nvim_set_hl(0, "@function.method.call.lua", { link = "GruvboxYellow" })

		vim.api.nvim_set_hl(0, "@punctuation.delimiter.javascript", { link = "GruvboxGray" })
		vim.api.nvim_set_hl(0, "@punctuation.bracket.javascript", { link = "GruvboxGray" })
		vim.api.nvim_set_hl(0, "@punctuation.delimiter.typescript", { link = "GruvboxGray" })
		vim.api.nvim_set_hl(0, "@punctuation.bracket.typescript", { link = "GruvboxGray" })
		vim.api.nvim_set_hl(0, "@punctuation.bracket.lua", { link = "GruvboxGray" })
		vim.api.nvim_set_hl(0, "@punctuation.delimiter.lua", { link = "GruvboxGray" })
		vim.api.nvim_set_hl(0, "@constructor.lua", { link = "GruvboxGray" })
		vim.api.nvim_set_hl(0, "@punctuation.special.javascript", { link = "GruvboxGray" })
		vim.api.nvim_set_hl(0, "@punctuation.special.typescript", { link = "GruvboxGray" })
		vim.api.nvim_set_hl(0, "@operator.javascript", { link = "GruvboxGray" })
		vim.api.nvim_set_hl(0, "@operator.typescript", { link = "GruvboxGray" })
		vim.api.nvim_set_hl(0, "@operator.lua", { link = "GruvboxGray" })
		vim.api.nvim_set_hl(0, "@operator.typescript", { link = "GruvboxGray" })
		vim.api.nvim_set_hl(0, "@constant.builtin.javascript", { link = "GruvboxPurple" })
		vim.api.nvim_set_hl(0, "@constant.builtin.typescript", { link = "GruvboxPurple" })
		vim.api.nvim_set_hl(0, "@constant.builtin.lua", { link = "GruvboxPurple" })
		vim.api.nvim_set_hl(0, "@constant.typescript", { link = "GruvboxBlue" })
		vim.api.nvim_set_hl(0, "@constant.builtin.typescript", { link = "GruvboxPurple" })
		vim.api.nvim_set_hl(0, "@function.method.javascript", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@function.method.typescript", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@function.javascript", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@function.typescript", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@function.lua", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@function.typescript", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@function.method.call.javascript", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@function.method.call.typescript", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@function.method.call.typescript", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@function.builtin.javascript", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@function.builtin.typescript", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@function.builtin.lua", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@function.call.javascript", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@function.call.typescript", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@function.call.typescript", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@function.call.lua", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@lsp.type.function.typescript", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@type.javascript", { link = "GruvboxBlue" })
		vim.api.nvim_set_hl(0, "@type.typescript", { link = "GruvboxBlue" })
		vim.api.nvim_set_hl(0, "@type.typescript", { link = "GruvboxBlue" })
		vim.api.nvim_set_hl(0, "@constructor.typescript", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@variable.jsdoc", { link = "GruvboxBlue" })
		vim.api.nvim_set_hl(0, "@punctuation.delimiter.jsdoc", { link = "GruvboxAqua" })
		vim.api.nvim_set_hl(0, "@keyword.jsdoc", { link = "GruvboxOrange" })
		vim.api.nvim_set_hl(0, "@keyword.import.typescript", { link = "GruvboxRed" })
		vim.api.nvim_set_hl(0, "@keyword.import.javascript", { link = "GruvboxRed" })
		vim.api.nvim_set_hl(0, "@type.builtin.javascript", { link = "GruvboxBlue" })
		vim.api.nvim_set_hl(0, "@type.builtin.typescript", { link = "GruvboxBlue" })
		vim.api.nvim_set_hl(0, "@variable.javascript", { link = "GruvboxBlue" })
		vim.api.nvim_set_hl(0, "@variable.lua", { link = "GruvboxBlue" })
		vim.api.nvim_set_hl(0, "@variable.typescript", { link = "GruvboxBlue" })
		vim.api.nvim_set_hl(0, "@variable.member.javascript", { link = "GruvboxFg1" })
		vim.api.nvim_set_hl(0, "@variable.member.typescript", { link = "GruvboxFg1" })
		vim.api.nvim_set_hl(0, "SignColumn", { fg = nil, bg = nil })
		vim.api.nvim_set_hl(0, "CocUnusedHighlight", { link = "Comment" })

		vim.api.nvim_set_hl(0, "@operator", { fg = "#ff7b72" })
		vim.api.nvim_set_hl(0, "@function.javascript", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@function.typescript", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@function.method", { fg = "#d2a8ff" })
		vim.api.nvim_set_hl(0, "@function.call", { fg = "#d2a8ff" })
		vim.api.nvim_set_hl(0, "@function.knockout", { fg = "#ffa657", bold = true })
		vim.api.nvim_set_hl(0, "@class.name", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@keyword.class", { link = "GruvboxOrange" })
		vim.api.nvim_set_hl(0, "@keyword.const", { link = "GruvboxOrange" })
		vim.api.nvim_set_hl(0, "@keyword.let", { link = "GruvboxOrange" })
		vim.api.nvim_set_hl(0, "@keyword.var", { link = "GruvboxOrange" })
		vim.api.nvim_set_hl(0, "@keyword.function", { link = "GruvboxOrange" })
		vim.api.nvim_set_hl(0, "@keyword.new", { link = "GruvboxOrange" })
		vim.api.nvim_set_hl(0, "@keyword.async", { link = "GruvboxOrange" })
		vim.api.nvim_set_hl(0, "@keyword.delete", { link = "GruvboxAqua" })

		vim.api.nvim_set_hl(0, "@special_operator", { link = "GruvboxRed" })

		vim.api.nvim_set_hl(0, "xmlEndTag", { link = "GruvboxBlue" })
		vim.api.nvim_set_hl(0, "xmlTag", { link = "GruvboxBlue" })
		vim.api.nvim_set_hl(0, "xmlTagName", { link = "GruvboxAquaBold" })

		vim.api.nvim_set_hl(0, "htmlTag", { link = "GruvboxBlue" })
		vim.api.nvim_set_hl(0, "htmlTagName", { link = "GruvboxAquaBold" })
		vim.api.nvim_set_hl(0, "htmlArg", { link = "GruvboxYellow" })

		vim.cmd("colorscheme gruvbox")
		vim.api.nvim_set_hl(0, "Normal", { bg = "#181b1c", fg = "#ebdbb2" })
		vim.api.nvim_set_hl(0, "CursorLine", { bg = "#24282a" })
		vim.cmd("hi SignColumn guibg=NONE cterm=NONE term=NONE")
	end,
}

return M
