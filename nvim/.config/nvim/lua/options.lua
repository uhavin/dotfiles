local HOME = vim.fn.expand("$HOME")

-- Visual
vim.g.markdown_fenced_languages = {'python', 'bash', 'javascript', 'lua', 'dosini'}
vim.o.cmdheight = 1
vim.o.colorcolumn = "89,121"
vim.o.conceallevel = 0
vim.o.pumheight = 100
vim.o.showmode = false
vim.o.showtabline = 1 -- do not show the tabline
vim.o.termguicolors = true -- Use true colors, required for some plugins
vim.o.title = true
vim.o.laststatus = 3  -- global statusline
vim.wo.cursorline = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = "yes:2"

-- Behaviour
vim.o.mouse = "a"
vim.o.scrolloff = 6 -- Minimum offset in lines to screen borders
vim.o.sidescrolloff = 8

vim.o.hlsearch = true
vim.o.ignorecase = true -- Ignore case when using lowercase in search
vim.o.smartcase = true -- But don't ignore it when using upper case
vim.o.smartindent = true
vim.o.smarttab = true

vim.o.expandtab = true -- Convert tabs to spaces.
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4

vim.o.splitbelow = true
vim.o.splitright = true

-- Vim specific
vim.o.backup = false
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.fileencoding = "utf-8"
vim.o.hidden = true -- Do not save when switching buffers
vim.o.spell = false
vim.o.spelllang = "en_us"
vim.o.swapfile = false
vim.o.undodir = HOME .. "/.local/var/nvim/undo"
vim.o.undofile = true
vim.o.updatetime = 300 -- Delay until write to Swap and HoldCommand event
vim.o.wildmode = "longest:full,full" -- Display auto-complete in Command Mode
vim.o.wrap = false

-- use dedicated pyenv for neovim
vim.g.python3_host_prog = HOME .. "/.pyenv/versions/nvim/bin/python"

-- Disable inline error messages
vim.diagnostic.config({
	virtual_text = false,
	underline = false, -- No error underline
	signs = true, -- Keep gutter signs
})
