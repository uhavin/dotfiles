vim.lsp.set_log_level("info")

local HOME = vim.fn.expand("$HOME")
local lspconfig = require("lspconfig")
local symbols = require("symbols")

local signs = {
	Error = symbols.Diagnostics.Error,
	Hint = symbols.Diagnostics.Hint,
	Info = symbols.Diagnostics.Info,
	Warn = symbols.Diagnostics.Warning,
}

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local custom_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	--Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "<space>k", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "<space>?", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "<space>gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

	require("illuminate").on_attach(client)
end
local custom_attach_no_formatting = function(client, bufnr)
	custom_attach(client, bufnr)

	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.document_range_formatting = false
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true
local language_servers = {
	"cssls",
	"dockerls",
	"html",
	"jsonls",
	"tailwindcss",
	"tsserver",
	"vuels",
	"yamlls",
}
for _, language_server in ipairs(language_servers) do
	lspconfig[language_server].setup({
		on_attach = custom_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		},
	})
end

-- LUA
lspconfig["sumneko_lua"].setup({
	on_attach = custom_attach,
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

-- PYTHON
local pyenv_version_nvim = HOME .. "/.pyenv/versions/nvim"
local project_python = HOME .. "/.pyenv/shims/python"

lspconfig["jedi_language_server"].setup({
	cmd = { pyenv_version_nvim .. "/bin/jedi-language-server" }, -- venv with python lsp installed
	on_attach = custom_attach_no_formatting,
	env_path = project_python, -- python venv to work on
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
