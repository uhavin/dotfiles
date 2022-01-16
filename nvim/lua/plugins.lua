-- Plugin definition and loading --
local cmd = vim.cmd

-- Rerun PackerCompile everytime pluggins.lua is updated --
cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- self-manage packer
	use({
		"wbthomason/packer.nvim",
		opt = true,
	})

	-- Colors
	use("ayu-theme/ayu-vim")
	use("cormacrelf/vim-colors-github")
	use("Mofiqul/vscode.nvim")

	-- Indent guides
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("plugins.indent-blankline")
		end,
	})

	-- History
	use({
		"mbbill/undotree",
		config = function()
			require("plugins.undotree")
		end,
	})

	-- Code comments
	use("tpope/vim-commentary")

	-- LSP server
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.lspconfig")
		end,
	})

	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("plugins.null-ls")
		end,
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
		config = function()
			require("plugins.cmp")
		end,
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.treesitter")
		end,
		run = ":TSUpdate",
	})

	-- formatting
	use({
		"sbdchd/neoformat",
		cmd = { "Neoformat" },
		config = function()
			require("plugins.neoformat")
		end,
	})

	-- NvimTree
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("plugins.nvim-tree")
		end, -- Must add this manually
	})

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("plugins.telescope")
		end,
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- bufferline
	use({
		"akinsho/nvim-bufferline.lua",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("plugins.bufferline")
		end,
		event = "BufWinEnter",
	})
	-- statusline
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins.lualine")
		end,
	})

	-- Git
	use({
		"lewis6991/gitsigns.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("plugins.gitsigns")
		end,
	})
	use("tpope/vim-fugitive")
	use("tpope/vim-rhubarb")
	use("junegunn/gv.vim")

	-- User friendliness
	use("junegunn/vim-peekaboo") -- preview registers
	use("simeji/winresizer") -- window resizer
	use("tpope/vim-surround")
	use("tpope/vim-repeat")
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && yarn install",
		ft = { "markdown" },
	})

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("plugins.nvim-autopairs")
		end, -- Must add this manually
	})
end)
