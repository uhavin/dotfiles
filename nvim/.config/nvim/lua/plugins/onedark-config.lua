require("onedark").setup({
	style = "light",
	ending_tildes = false,
	highlights = {
		LspReferenceText = { fmt = "none", bg = "$bg2" },
		LspReferenceWrite = { fmt = "none", bg = "$bg2" },
		LspReferenceRead = { fmt = "none", bg = "$bg2" },
		NvimTreeNormal = { bg = "$bg2" },
		NvimTreeEndOfBuffer = { bg = "$bg2" },
		DebugSymbolsBreakpoint = { fg = "$red" },
		DebugSymbolsStopped = { fg = "$green" },
	},
	code_style = {
		comments = "none",
		keywords = "none",
		functions = "none",
		strings = "none",
		variables = "none",
	},
})
