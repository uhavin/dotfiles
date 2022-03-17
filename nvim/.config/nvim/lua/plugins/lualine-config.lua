local gps = require("nvim-gps")

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			{ "branch", icon = "" },
			{
				"diff",
				diff_color = {
					added = { fg = "#009933" },
					modified = { fg = "#0099ff" },
					removed = { fg = "#cc3300" },
				},
			},
		},
		lualine_c = {
			"filename",
			{ gps.get_location, cond = gps.is_available },
		},
		lualine_x = {
			"diagnostics",
			"fileformat",
			"encoding",
			"filetype",
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
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
