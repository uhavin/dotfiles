local symbols = require("symbols")

vim.g.symbols_outline = {
	-- highlight_hovered_item = true,
	-- show_guides = true,
	auto_preview = false,
	-- position = 'right',
	-- relative_width = true,
	width = 33,
	auto_close = false,
	-- show_numbers = false,
	-- show_relative_numbers = false,
	-- show_symbol_details = true,
	-- preview_bg_highligTt = 'Pmenu',
	keymaps = { -- These keymaps can be a string or a table for multiple keys
		close = { "q" },
		--     goto_location = "<CR>",
		focus_location = { "o", "." },
		--     hover_symbol = "<C-space>",
		--     toggle_preview = "K",
		--     rename_symbol = "r",
		--     code_actions = "a",
	},
	-- lsp_blacklist = {},
	-- symbol_blacklist = {},
	symbols = {
		Array = { icon = symbols.Code.Array, hl = "TSConstant" },
		Boolean = { icon = symbols.Code.Array, hl = "TSBoolean" },
		Class = { icon = symbols.Code.Class, hl = "TSType" },
		Constant = { icon = symbols.Code.Constant, hl = "TSConstant" },
		Constructor = { icon = symbols.Code.Constructor, hl = "TSConstructor" },
		Enum = { icon = symbols.Code.Enum, hl = "TSType" },
		EnumMember = { icon = symbols.Code.EnumMember, hl = "TSField" },
		Event = { icon = symbols.Code.Event, hl = "TSType" },
		Field = { icon = symbols.Code.Field, hl = "TSField" },
		File = { icon = symbols.Files.File, hl = "TSURI" },
		Function = { icon = symbols.Code.Function, hl = "TSFunction" },
		Interface = { icon = symbols.Code.Interface, hl = "TSType" },
		Key = { icon = symbols.Code.Keyword, hl = "TSType" },
		Method = { icon = symbols.Code.Method, hl = "TSMethod" },
		Module = { icon = symbols.Code.Module, hl = "TSNamespace" },
		Namespace = { icon = symbols.Code.Namespace, hl = "TSNamespace" },
		Null = { icon = symbols.Code.Null, hl = "TSType" },
		Number = { icon = symbols.Code.Number, hl = "TSNumber" },
		Object = { icon = "⦿", hl = "TSType" },
		Operator = { icon = "+", hl = "TSOperator" },
		Package = { icon = "", hl = "TSNamespace" },
		Property = { icon = "", hl = "TSMethod" },
		String = { icon = "", hl = "TSString" },
		Struct = { icon = "פּ", hl = "TSType" },
		TypeParameter = { icon = "𝙏 ", hl = "TSParameter" },
		Variable = { icon = "", hl = "TSConstant" },
	},
}
