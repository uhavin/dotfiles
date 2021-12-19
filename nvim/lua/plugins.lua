-- Plugin definition and loading --
local execute = vim.api.nvim_command
local fn = vim.fn
local cmd = vim.cmd

-- Boostrap Packer -- 
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone','https://github.com/wbthomason/packer.nvim', install_path})
end

-- Rerun PackerCompile everytime pluggins.lua is updated --
cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

cmd([[packadd packer.nvim]])

return require('packer').startup(function(use)
    -- self-manage packer
    use({
        'wbthomason/packer.nvim', 
        opt = true
    }) 

    -- Colors
    use 'ayu-theme/ayu-vim'
    use 'cormacrelf/vim-colors-github'
    use 'sainnhe/edge'
    use 'Mofiqul/vscode.nvim'

    -- History
    use ({
        'mbbill/undotree',
        config = function() require('plugins.undotree') end,
    })

    -- Code comments
    use 'tpope/vim-commentary'
    -- LSP server
    use({
        'neovim/nvim-lspconfig',
        config = function() require('plugins.lspconfig') end
    })

   -- Intellisense
   use({
     "hrsh7th/nvim-cmp",
     -- Sources for nvim-cmp
     requires = {
       "hrsh7th/cmp-nvim-lsp",
       "hrsh7th/cmp-buffer",
       "hrsh7th/cmp-path",
       "hrsh7th/cmp-nvim-lua",
     },
     config = function() require('plugins.cmp') end,
   })

  -- Treesitter
  use({
    'nvim-treesitter/nvim-treesitter',
    config = function() require('plugins.treesitter') end,
    run = ':TSUpdate'
  })

  -- NvimTree
  use({
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require('plugins.nvim-tree') end,  -- Must add this manually
  })
  -- Telescope
  use({
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/plenary.nvim'}},
    config = function() require('plugins.telescope') end,
  })
  use({'nvim-telescope/telescope-fzf-native.nvim', run ='make'})

  -- bufferline
  use({
    'akinsho/nvim-bufferline.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require('plugins.bufferline') end,
    event = 'BufWinEnter',
  })
  -- statusline
  use({
    'hoob3rt/lualine.nvim',
    -- config = function() require('plugins.lualine') end,
  })

  -- Git
  use 'mhinz/vim-signify'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'junegunn/gv.vim'

end)
