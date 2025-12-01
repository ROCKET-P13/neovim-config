local M = {
	"ellisonleao/gruvbox.nvim",
	config = function()
		require("gruvbox").setup({
			terminal_colors = false,
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

		-- c# custom highlights
		vim.api.nvim_set_hl(0, "@using_module", { link = "GruvboxGreen" })
		vim.api.nvim_set_hl(0, "@file_scoped_namespace_declaration", { link = "GruvboxGreen" })

		-- c# highlights
		vim.api.nvim_set_hl(0, "@keyword.type.c_sharp", { link = "GruvboxOrange" })
		vim.api.nvim_set_hl(0, "@punctuation.delimiter.c_sharp", { link = "GruvboxGray" })
		vim.api.nvim_set_hl(0, "@keyword.modifier.c_sharp", { link = "GruvboxOrange" })
		vim.api.nvim_set_hl(0, "@keyword.operator.c_sharp", { link = "GruvboxAqua" })
		vim.api.nvim_set_hl(0, "@variable.c_sharp", { link = "GruvboxBlue" })
		vim.api.nvim_set_hl(0, "@variable.member.c_sharp", { link = "GruvboxBlue" })
		vim.api.nvim_set_hl(0, "@variable.parameter.c_sharp", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@function.method.c_sharp", { link = "GruvboxGreen" })
		vim.api.nvim_set_hl(0, "@function.method.call.c_sharp", { link = "GruvboxGreen" })
		vim.api.nvim_set_hl(0, "@keyword.c_sharp", { link = "GruvboxOrange" })
		vim.api.nvim_set_hl(0, "@property.c_sharp", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@keyword.import.c_sharp", { link = "GruvboxRed" })
		vim.api.nvim_set_hl(0, "@punctuation.bracket.c_sharp", { link = "GruvboxGray" })
		vim.api.nvim_set_hl(0, "@type.builtin.c_sharp", { link = "GruvboxRed" })
		vim.api.nvim_set_hl(0, "@operator.c_sharp", { link = "GruvboxGray" })

		-- lua highlights
		vim.api.nvim_set_hl(0, "@function.method.call.lua", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@punctuation.bracket.lua", { link = "GruvboxGray" })
		vim.api.nvim_set_hl(0, "@punctuation.delimiter.lua", { link = "GruvboxGray" })
		vim.api.nvim_set_hl(0, "@constructor.lua", { link = "GruvboxGray" })
		vim.api.nvim_set_hl(0, "@operator.lua", { link = "GruvboxGray" })
		vim.api.nvim_set_hl(0, "@constant.builtin.lua", { link = "GruvboxPurple" })
		vim.api.nvim_set_hl(0, "@function.lua", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@function.builtin.lua", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@function.call.lua", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@variable.lua", { link = "GruvboxBlue" })

		-- general highlights
		vim.api.nvim_set_hl(0, "@operator", { fg = "#ff7b72" })
		vim.api.nvim_set_hl(0, "@function.method", { fg = "#d2a8ff" })
		vim.api.nvim_set_hl(0, "@function.call", { fg = "#d2a8ff" })
		vim.api.nvim_set_hl(0, "@class.name", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@keyword.class", { link = "GruvboxOrange" })
		vim.api.nvim_set_hl(0, "@keyword.const", { link = "GruvboxOrange" })
		vim.api.nvim_set_hl(0, "@keyword.let", { link = "GruvboxOrange" })
		vim.api.nvim_set_hl(0, "@keyword.var", { link = "GruvboxOrange" })
		vim.api.nvim_set_hl(0, "@keyword.function", { link = "GruvboxOrange" })
		vim.api.nvim_set_hl(0, "@keyword.new", { link = "GruvboxOrange" })
		vim.api.nvim_set_hl(0, "@keyword.async", { link = "GruvboxOrange" })
		vim.api.nvim_set_hl(0, "@keyword.delete", { link = "GruvboxAqua" })
		vim.api.nvim_set_hl(0, "SignColumn", { fg = nil, bg = nil })
		vim.api.nvim_set_hl(0, "CocUnusedHighlight", { link = "Comment" })
		vim.api.nvim_set_hl(0, "@punctuation.delimiter", { link = "GruvboxGray" })
		vim.api.nvim_set_hl(0, "@special_operator", { link = "GruvboxRed" })

		-- query highlights
		vim.api.nvim_set_hl(0, "@punctuation.bracket.query", { link = "GruvboxGray" })
		vim.api.nvim_set_hl(0, "@function.call.query", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@punctuation.special.query", { link = "GruvboxGray" })
		vim.api.nvim_set_hl(0, "@variable.query", { link = "GruvboxBlue" })

		-- javascript/typescript custom highlights
		vim.api.nvim_set_hl(0, "@private_class_property", { link = "GruvboxBlue" })
		vim.api.nvim_set_hl(0, "@private_class_property_assignment", { link = "GruvboxBlue" })
		vim.api.nvim_set_hl(0, "@new_class_instance", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@class_name", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@class_extends", { link = "GruvboxFg1" })
		vim.api.nvim_set_hl(0, "@shorthand_property_identifier", { link = "GruvboxBlue" })
		vim.api.nvim_set_hl(0, "@property_reference", { link = "GruvboxBlue" })
		vim.api.nvim_set_hl(0, "@method_call", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@enum_name", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@testingg", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@constructor_call", { link = "GruvboxOrange" })
		vim.api.nvim_set_hl(0, "@object_property_key", { link = "GruvboxFg1" })
		vim.api.nvim_set_hl(0, "@class.this", { link = "GruvboxOrange" })
		vim.api.nvim_set_hl(0, "@class.super", { link = "GruvboxOrange" })
		vim.api.nvim_set_hl(0, "@const_arrow_function", { link = "GruvboxYellow" })

		-- javascript highlights
		vim.api.nvim_set_hl(0, "@punctuation.delimiter.javascript", { link = "GruvboxGray" })
		vim.api.nvim_set_hl(0, "@punctuation.bracket.javascript", { link = "GruvboxGray" })
		vim.api.nvim_set_hl(0, "@punctuation.special.javascript", { link = "GruvboxGray" })
		vim.api.nvim_set_hl(0, "@operator.javascript", { link = "GruvboxGray" })
		vim.api.nvim_set_hl(0, "@constant.builtin.javascript", { link = "GruvboxPurple" })
		vim.api.nvim_set_hl(0, "@function.method.javascript", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@function.javascript", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@function.method.call.javascript", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@function.builtin.javascript", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@function.call.javascript", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@type.javascript", { link = "GruvboxBlue" })
		vim.api.nvim_set_hl(0, "@variable.jsdoc", { link = "GruvboxBlue" })
		vim.api.nvim_set_hl(0, "@punctuation.delimiter.jsdoc", { link = "GruvboxAqua" })
		vim.api.nvim_set_hl(0, "@keyword.jsdoc", { link = "GruvboxOrange" })
		vim.api.nvim_set_hl(0, "@keyword.import.javascript", { link = "GruvboxRed" })
		vim.api.nvim_set_hl(0, "@type.builtin.javascript", { link = "GruvboxBlue" })
		vim.api.nvim_set_hl(0, "@variable.javascript", { link = "GruvboxBlue" })
		vim.api.nvim_set_hl(0, "@constructor.javascript", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@function.javascript", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@function.knockout", { fg = "#ffa657", bold = true })
		vim.api.nvim_set_hl(0, "@function.knockout.javascript", { fg = "#ffa657", bold = true })
		vim.api.nvim_set_hl(0, "@keyword.function.javascript", { link = "GruvboxOrange" })
		vim.api.nvim_set_hl(0, "@variable.builtin.javascript", { link = "GruvboxBlue" })

		-- typescript highlights
		vim.api.nvim_set_hl(0, "@punctuation.special.typescript", { link = "GruvboxGray" })
		vim.api.nvim_set_hl(0, "@punctuation.delimiter.typescript", { link = "GruvboxGray" })
		vim.api.nvim_set_hl(0, "@punctuation.bracket.typescript", { link = "GruvboxGray" })
		vim.api.nvim_set_hl(0, "@operator.typescript", { link = "GruvboxGray" })
		vim.api.nvim_set_hl(0, "@constant.builtin.typescript", { link = "GruvboxPurple" })
		vim.api.nvim_set_hl(0, "@operator.typescript", { link = "GruvboxGray" })
		vim.api.nvim_set_hl(0, "@function.method.typescript", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@constant.typescript", { link = "GruvboxBlue" })
		vim.api.nvim_set_hl(0, "@constant.builtin.typescript", { link = "GruvboxPurple" })
		vim.api.nvim_set_hl(0, "@function.typescript", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@variable.typescript", { link = "GruvboxBlue" })
		vim.api.nvim_set_hl(0, "@variable.typescript", { link = "GruvboxBlue" })
		vim.api.nvim_set_hl(0, "@variable.member.typescript", { link = "GruvboxFg1" })
		vim.api.nvim_set_hl(0, "@type.builtin.typescript", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@type.typescript", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@type.typescript", { link = "GruvboxBlue" })
		vim.api.nvim_set_hl(0, "@type.typescript", { link = "GruvboxBlue" })
		vim.api.nvim_set_hl(0, "@constructor.typescript", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@function.call.typescript", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@keyword.import.typescript", { link = "GruvboxRed" })
		vim.api.nvim_set_hl(0, "@lsp.type.function.typescript", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@function.builtin.typescript", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@function.method.call.typescript", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@function.method.call.typescript", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@function.typescript", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@function.typescript", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@variable.builtin.typescript", { link = "GruvboxBlue" })

		-- xml highlights
		vim.api.nvim_set_hl(0, "xmlEndTag", { link = "GruvboxBlue" })
		vim.api.nvim_set_hl(0, "xmlTag", { link = "GruvboxBlue" })
		vim.api.nvim_set_hl(0, "xmlTagName", { link = "GruvboxAquaBold" })

		-- html highlights
		vim.api.nvim_set_hl(0, "@tag.delimiter.html", { link = "GruvboxAqua" })
		vim.api.nvim_set_hl(0, "@tag.html", { link = "GruvboxAqua" })
		vim.api.nvim_set_hl(0, "@tag.attribute.html", { link = "GruvboxYellow" })
		vim.api.nvim_set_hl(0, "@operator.html", { link = "GruvboxGray" })

		-- json highlights
		vim.api.nvim_set_hl(0, "jsonKeyword", { link = "GruvboxAqua" })
		vim.api.nvim_set_hl(0, "jsonString", { link = "GruvboxBlue" })
		vim.api.nvim_set_hl(0, "@punctuation.delimiter.json", { link = "GruvboxGray" })
		vim.api.nvim_set_hl(0, "@punctuation.bracket.json", { link = "GruvboxGray" })
		vim.api.nvim_set_hl(0, "@property.json", { link = "GruvboxAqua" })
		vim.api.nvim_set_hl(0, "@string.json", { link = "GruvboxBlue" })
		vim.api.nvim_set_hl(0, "@string.escape.json", { link = "GruvboxPurple" })

		vim.cmd("colorscheme gruvbox")
		-- vim.api.nvim_set_hl(0, "Normal", { bg = "#1d2021", fg = "#1d2021" })
		-- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#181b1c" })
		-- vim.api.nvim_set_hl(0, "", { bg = "#24282a" })

		vim.cmd("hi SignColumn guibg=NONE cterm=NONE term=NONE")
		-- vim.cmd("hi Normal guibg=NONE cterm=NONE term=NONE")
	end,
}

return M
