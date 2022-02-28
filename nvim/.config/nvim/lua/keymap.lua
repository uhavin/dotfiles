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
nnoremap("<leader>/", ":noh<cr>")

-- popup menu tab-select
inoremap_expr("<Tab>", "v:lua.smart_tab()")
inoremap_expr("<S-Tab>", "v:lua.smart_shift_tab()")

-- nvim tree
nnoremap("<Leader>n", ":NvimTreeToggle<CR>")
nnoremap("<Leader>.", ":NvimTreeFindFile<CR>")
-- -- telescope
nnoremap("<Leader>;", ":FzfLua files<cr>")
nnoremap("<Leader>e", ":FzfLua buffers<cr>")
nnoremap("<Leader>fg", ":FzfLua live_grep<cr>")

-- winresizer
nnoremap("<Leader>w", ":WinResizerStartResize<cr>")

-- harpoon marks
nnoremap("<leader>ha", ":lua require('harpoon.mark').add_file()<CR>")
nnoremap("<leader>hm", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")
