local palette = require("onedark.palette")

-- palette.light["diff_add_bg"] = "#ddffdd"
-- palette.light["diff_change_bg"] = "#ddddff"
-- palette.light["diff_delete_bg"] = "#ffdddd"

require("onedark").setup({
	style = "light",
	ending_tildes = false,
	highlights = {
		-- GitSignsAdd = { bg = "$diff_add_bg" },
		-- GitSignsChange = { bg = "$diff_change_bg" },
		-- GitSignsDelete = { bg = "$diff_delete_bg" },
		LspReferenceText = { fmt = "none", bg = "$bg2" },
		LspReferenceWrite = { fmt = "none", bg = "$bg2" },
		LspReferenceRead = { fmt = "none", bg = "$bg2" },
		NvimTreeNormal = { bg = "$bg2" },
		NvimTreeEndOfBuffer = { bg = "$bg2" },
	},
	code_style = {
		comments = "none",
		keywords = "none",
		functions = "none",
		strings = "none",
		variables = "none",
	},
})
