vim.opt.list = true

require("indent_blankline").setup({
    char = "┊",
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = false,
	show_trailing_blankline_indent = false,
})
