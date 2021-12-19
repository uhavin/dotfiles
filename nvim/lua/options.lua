local HOME = vim.fn.expand("$HOME")

-- Visual
vim.o.colorcolumn = '89,120'
vim.o.conceallevel = 0
vim.o.cmdheight = 1
vim.o.pumheight = 10
vim.o.showmode = true     
vim.o.showtabline = 2 -- Always show tabline
vim.o.title = true
vim.o.termguicolors = true -- Use true colors, required for some plugins
vim.wo.number = true
vim.wo.relativenumber = false
vim.wo.signcolumn = 'yes'
vim.wo.cursorline = true

-- Behaviour
vim.o.hlsearch = true
vim.o.ignorecase = true -- Ignore case when using lowercase in search
vim.o.smartcase = true -- But don't ignore it when using upper case
vim.o.smarttab = true
vim.o.smartindent = true
vim.o.expandtab = true -- Convert tabs to spaces.
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.scrolloff = 12 -- Minimum offset in lines to screen borders
vim.o.sidescrolloff = 8
vim.o.mouse = 'a'

-- Vim specific
vim.o.hidden = true -- Do not save when switching buffers
vim.o.fileencoding = "utf-8"
vim.o.spell = false
vim.o.spelllang = "en_us"
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.wildmode = "longest:full,full" -- Display auto-complete in Command Mode
vim.o.updatetime = 300 -- Delay until write to Swap and HoldCommand event

vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true
vim.o.undodir = HOME .. "/.local/var/nvim/undo"
vim.o.wrap = false

vim.g.python3_host_prog = HOME .. "/.pyenv/versions/nvim/bin/python"

-- Disable inline error messages
vim.diagnostic.config {
  virtual_text = false,
  underline = false, -- Keep error underline
  signs = true, -- Keep gutter signs
}
