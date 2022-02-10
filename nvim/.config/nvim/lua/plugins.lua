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
	-- Treesitter supported, dark and light variant throuhg vim bg=
	use("sainnhe/edge")
	use("Mofiqul/vscode.nvim")
	use("rmehri01/onenord.nvim")
	use("dracula/vim")
	use("rose-pine/neovim")
	use("mhartington/oceanic-next")
	use("rebelot/kanagawa.nvim")
	use("fenetikm/falcon")
	use("marko-cerovac/material.nvim")
	-- Indent guides
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("plugins.indent-blankline")
		end,
	})
	use({ "RRethy/vim-illuminate" })

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
			-- lsp menu symbols
			"onsails/lspkind-nvim",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			require("plugins.cmp")
		end,
	})
	-- snippets
	use({
		"L3MON4D3/LuaSnip",
		config = function()
			require("plugins.luasnip-config")
		end,
	})
	use({ "rafamadriz/friendly-snippets" })

	use({
		"danymat/neogen",
		config = function()
			require("plugins.neogen-config")
		end,
		requires = "nvim-treesitter/nvim-treesitter",
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.treesitter-config")
		end,
		run = ":TSUpdate",
	})

	-- NvimTree
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("plugins.nvim-tree")
		end,
	})

	-- Fuzzy finding
	use({ "junegunn/fzf", run = "./install --bin" })
	use({
		"ibhagwan/fzf-lua",
		-- optional for icon support
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	-- statusline
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins.lualine-config")
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
		"ThePrimeagen/harpoon",
		requires = { "nvim-lua/plenary.nvim" },
	})

	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && yarn install",
		ft = { "markdown" },
	})

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("plugins.nvim-autopairs")
		end,
	})
end)
