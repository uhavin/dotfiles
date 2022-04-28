require("config-local").setup({
	-- Default configuration (optional)
	config_files = { ".nvimrc.lua", ".nvimrc" }, -- Config file patterns to load (lua supported)
	hashfile = vim.fn.stdpath("data") .. "/config-local", -- Where the plugin keeps files data
	autocommands_create = false, -- Create autocommands (VimEnter, DirectoryChanged)
	commands_create = false, -- Create commands (ConfigSource, ConfigEdit, ConfigTrust, ConfigIgnore)
	silent = false, -- Disable plugin messages (Config loaded/ignored)
	lookup_parents = true, -- Lookup config files in parent directories
})
