-- Tab/Shift-Tab popup menu selection functions (to use later in mapping).
local function _t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab()
    return vim.fn.pumvisible() == 1 and _t'<C-n>' or _t'<Tab>'
end
function _G.smart_shift_tab()
    return vim.fn.pumvisible() == 1 and _t'<C-p>' or _t'<S-Tab>'
end

-- map helpers
function nmap(keys, action)
  vim.api.nvim_set_keymap('n', keys, action, {silent = true, noremap = false})
end
function nnoremap(keys, action)
  vim.api.nvim_set_keymap('n', keys, action, {silent = true, noremap = true})
end
function vnoremap(keys, action)
  vim.api.nvim_set_keymap('v', keys, action, {silent = true, noremap = true})
end
function inoremap(keys, action)
  vim.api.nvim_set_keymap('i', keys, action, {silent = true, noremap = true})
end
function inoremap_expr(keys, action)
  vim.api.nvim_set_keymap('i', keys, action, {silent = true, noremap = true, expr = true})
end

vim.g.mapleader = ';'
vim.g.maplocalleader = ';'

-- Moving
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")

-- clear search highlight
nnoremap("<leader>/", ":noh<cr>")

-- popup menu tab-select
inoremap_expr('<Tab>', 'v:lua.smart_tab()')
inoremap_expr('<S-Tab>', 'v:lua.smart_shift_tab()')
