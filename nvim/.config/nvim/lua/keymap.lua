require("keymap.helpers")

vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

-- Moving
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")

-- Move line/selection up and down.
vnoremap("K", ":m '<-2<CR>gv=gv")
vnoremap("J", ":m '>+1<CR>gv=gv")

-- clear search highlight
nnoremap("<leader>/", ":noh<CR>")

-- popup menu tab-select
inoremap_expr("<Tab>", "v:lua.smart_tab()")
inoremap_expr("<S-Tab>", "v:lua.smart_shift_tab()")

-- file tree
nnoremap("<Leader>tn", ":Neotree toggle<CR>")
nnoremap("<Leader>t.", ":Neotree reveal_file=%<CR>")
nnoremap("<Leader>tb", ":Neotree buffers toggle right<CR>")
nnoremap("<Leader>tg", ":Neotree git_statur reveal")
-- -- fuzzy finder
nnoremap("<Leader>ff", ":FzfLua files<CR>")
nnoremap("<Leader>fb", ":FzfLua buffers<CR>")
nnoremap("<Leader>fo", ":FzfLua oldfiles<CR>")

nnoremap("<Leader>fg", ":FzfLua live_grep<CR>")
nnoremap("<Leader><Space>", ":FzfLua lsp_code_actions<CR>")

-- winresizer
nnoremap("<Leader>w", ":WinResizerStartResize<CR>")

-- harpoon marks
nnoremap("<leader>hm", ":lua require('harpoon.mark').add_file()<CR>")
nnoremap("<leader>hh", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")

-- next/previous git change.
nnoremap("<Leader>>", ":Gitsigns next_hunk<CR>")
nnoremap("<Leader><", ":Gitsigns previous_hunk<CR>")

-- database
nnoremap("<Leader>db", ":DBUIToggle<CR>")
nnoremap("<leader>qs", "<Plug>(DBUI_SaveQuery)")
nnoremap("<leader>qe", "<Plug>(DBUI_ExecuteQuery)")

nnoremap("<F5>", ":lua require'dap'.continue()<CR>")
nnoremap("<leader>dd", ":lua require('dap').continue()<CR>")
nnoremap("<F10>", ":lua require'dap'.step_over()<CR>")
nnoremap("<leader>dn", ":lua require'dap'.step_over()<CR>")
nnoremap("<F11>", ":lua require'dap'.step_into()<CR>")
nnoremap("<leader>di", ":lua require'dap'.step_into()<CR>")
nnoremap("<F12>", ":lua require'dap'.step_out()<CR>")
nnoremap("<leader>do", ":lua require'dap'.step_out()<CR>")
nnoremap("<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
nnoremap("<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
nnoremap("<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
nnoremap("<leader>dr", ":lua require'dap'.repl.open()<CR>")
nnoremap("<leader>dl", ":lua require'dap'.repl.run_last()<CR>`")
-- nnoremap("<leader>dn", ":lua require('dap-python').test_method()<CR>")
-- vnoremap("<leader>ds", "<ESC>:lua require('dap-python').debug_selection()<CR>")
