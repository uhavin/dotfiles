require("onedark").setup({
    -- Default theme style.
    -- Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    style = "warmer",
    transparent = false,
    term_colors = true,
    ending_tildes = false,

    -- toggle theme style ---
    toggle_style_key = "<leader>bg", -- Default keybinding to toggle
    toggle_style_list = {
        "warmer",
        "light",
    },

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
    code_style = {
        comments = "none",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none",
    },

    colors = {},
    highlights = {
        TSParameter = { fg = "$fg" },
        LspReferenceText = { fmt = "none", bg = "$bg2" },
        LspReferenceWrite = { fmt = "none", bg = "$bg2" },
        LspReferenceRead = { fmt = "none", bg = "$bg2" },
    },
    -- Plugins Config --
    diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = false, -- use undercurl instead of underline for diagnostics
        background = true, -- use background color for virtual text
    },
})

vim.cmd("colorscheme onedark")

local thingy = ""
print(thingy)
