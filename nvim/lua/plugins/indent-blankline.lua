vim.opt.list = true

require("indent_blankline").setup({
	space_char_blankline = " ",
	show_current_context = false,
	show_current_context_start = false,
	show_trailing_blankline_indent = false,
})

-- set highlight color for current context
-- vim.cmd("highlight IndentBlanklineContextChar guifg=#5f7f9f gui=nocombine")
