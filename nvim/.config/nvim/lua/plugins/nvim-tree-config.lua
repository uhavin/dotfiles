-- NVIM tree
vim.g.nvim_tree_icons = {
	git = {
		unstaged = "*",
		staged = "+",
		unmerged = "?",
		renamed = "~",
		untracked = "%",
		deleted = "-",
		ignored = ".",
	},
}

require("nvim-tree").setup({
	-- Allow using gx
	disable_netrw = true,
	hijack_netrw = true,
	update_cwd = true,
	filters = {
		custom = {
			"__pycache__",
			".mypy_cache",
            ".python-version",
		},
	},
})
