vim.opt.list = true

require("indent_blankline").setup({
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = false,
	show_trailing_blankline_indent = false,
})

-- set highlight color for current context
vim.cmd("highlight IndentBlanklineChar guifg=#606060 gui=nocombine")
