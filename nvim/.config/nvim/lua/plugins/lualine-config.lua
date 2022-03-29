local gps = require("nvim-gps")
local symbols = require("symbols")

require("lualine").setup({
	options = {
		globalstatus = true,
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = {
			{
				"mode",
				fmt = function(str)
					return str:sub(1, 2)
				end,
			},
		},
		lualine_b = {
			{
				"diagnostics",
				symbols = {
					error = symbols.Diagnostics.Error,
					hint = symbols.Diagnostics.Hint,
					info = symbols.Diagnostics.Info,
					warn = symbols.Diagnostics.Warning,
				},
			},
		},
		lualine_c = {
			{ gps.get_location, cond = gps.is_available },
		},
		lualine_x = {
			{
				"branch",
				icon = {
					symbols.Git.Icon,
					color = { fg = "#cc6666" },
				},
			},
		},
		lualine_y = {
			{
				"filetype",
				icon_only = true,
			},
			"filename",
			{
				"diff",
				-- icon = symbols.Git.Compare,
				symbols = {
					added = symbols.Git.Added,
					modified = symbols.Git.Modified,
					removed = symbols.Git.Removed,
				},
			},
		},
		lualine_z = {
			{
				"fileformat",
				symbols = {
					unix = symbols.OS.Linux,
					dos = symbols.OS.Windows,
					mac = symbols.OS.Mac,
				},
			},
			"encoding",
			"location",
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = {},
		lualine_y = {
			{ "branch", icon = symbols.Git.Branch },
		},
		lualine_z = { "location" },
	},
	tabline = {
		-- Nah.
		-- lualine_a = {'buffers'},
		-- lualine_b = {},
		-- lualine_c = {},
		-- lualine_x = {},
		-- lualine_y = {},
		-- lualine_z = {'tabs'}
	},
	extensions = {
		"nvim-tree",
		"fugitive",
		"symbols-outline",
	},
})
