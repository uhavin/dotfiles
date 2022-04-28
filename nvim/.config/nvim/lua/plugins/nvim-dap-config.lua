local M = {}
local dap, dapui = require("dap"), require("dapui")

local function configure()
	local dap_breakpoint = {
		error = {
			text = "🌑",
			texthl = "DebugSymbolsBreakpoint",
			linehl = "",
			numhl = "",
		},
		rejected = {
			text = "🌕",
			texthl = "DebugSymbolsBreakpoint",
			linehl = "",
			numhl = "",
		},
		stopped = {
			text = "➡️",
			texthl = "DebugSymbolsStopped",
			linehl = "",
			numhl = "",
		},
	}

	vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
	vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
	vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
end

local function configure_exts()
	require("nvim-dap-virtual-text").setup({
		commented = true,
	})
	dapui.setup({}) -- use default
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end
end

local function setup_python()
	local HOME = vim.fn.expand("$HOME")
	dap.adapters.python = {
		type = "executable",
		command = HOME .. "/.pyenv/versions/nvim/bin/python",
		args = { "-m", "debugpy.adapter" },
	}

	dap.configurations.python = {
		{
			-- The first three options are required by nvim-dap
			type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
			request = "launch",
			name = "Launch file",

			-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

			program = "${file}", -- This configuration will launch the current file if used.
			python = HOME .. "/.pyenv/shims/python",
		},
	}
end

local function configure_debuggers()
	setup_python()
end

function M.setup()
	configure() -- Configuration
	configure_exts() -- Extensions
	configure_debuggers() -- Debugger
end

return M
