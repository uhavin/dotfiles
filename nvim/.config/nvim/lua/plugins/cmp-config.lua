lspkind = require("lspkind")
local fn = vim.fn
local cmp = require("cmp")
local luasnip = require("luasnip")

local select_next = function(fallback)
	if cmp.visible() then
		cmp.select_next_item()
	elseif luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	else
		fallback()
	end
end

local select_previous = function(fallback)
	if cmp.visible() then
		cmp.select_prev_item()
	elseif luasnip.expand_or_jumpable(-1) then
		luasnip.expand_or_jump(-1)
	else
		fallback()
	end
end

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text",
			maxwidth = 88, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
			-- before = function(entry, vim_item)
			-- -- ...
			-- 	return vim_item
			-- end,
		}),
	},
	mapping = {
		-- open/close autocomplete
		["<C-Space>"] = function(fallback)
			if cmp.visible() then
				cmp.close()
			else
				cmp.complete()
			end
		end,

		["<C-c>"] = cmp.mapping.close(),

		-- select completion
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		}),

		["<Tab>"] = select_next,
		["<S-Tab>"] = select_previous,
		["<C-j>"] = select_next,
		["<C-k>"] = select_previous,

		-- Scroll documentation
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
	},

	-- Complete options from the LSP servers and the snippet engine
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "nvim_lua" },
		{ name = "path" },
		{ name = "spell" },
		{ name = "buffer" },
		-- {name = 'calc'},
	},
})
