require('nvim-treesitter.configs').setup({
	highlight = { 
        enable = true, 
        additional_vim_regex_highlighting = false
    },
	ensure_installed = { -- We must manually specify which parsers to install
        "bash",
        "c_sharp",
        "comment",
        "css",
        "dockerfile",
        "html",
        "javascript",
        "json",
        "make",
        "lua",
        "php",
        "python",
        "regex",
        "typescript",
        "vim",
        "vue",
        "yaml",
	},
})