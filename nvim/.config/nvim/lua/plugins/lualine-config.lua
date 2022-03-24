local gps = require("nvim-gps")
local symbols = require("symbols")

local diagnostic_colors = {} -- will use defaults when empty
if vim.g.colors_name == "gruvbox-material" then
	local background = vim.opt.background:get()
	local configuration = vim.fn["gruvbox_material#get_configuration"]()
	local palette = vim.fn["gruvbox_material#get_palette"](background, configuration.palette)

	diagnostic_colors["error"] = { fg = palette.red[1] }
	diagnostic_colors["warn"] = { fg = palette.yellow[1] }
	diagnostic_colors["info"] = { fg = palette.blue[1] }
	diagnostic_colors["hint"] = { fg = palette.green[1] }
end

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
		lualine_a = {
			{
				"mode",
				fmt = function(str)
					return str:sub(1, 1)
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
				diagnostics_color = diagnostic_colors,
			},
		},
		lualine_c = {
			{ gps.get_location, cond = gps.is_available },
		},
		lualine_x = {
			{
				"filetype",
				icon_only = true,
			},
			"filename",
			"encoding",
			{
				"fileformat",
				symbols = {
					unix = symbols.OS.Linux,
					dos = symbols.OS.Windows,
					mac = symbols.OS.Mac,
				},
			},
		},
		lualine_y = {
			{
				"branch",
				icon = symbols.Git.Branch,
			},
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
