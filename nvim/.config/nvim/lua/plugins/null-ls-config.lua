local HOME = vim.fn.expand("$HOME")
local null_ls = require("null-ls")

---Create path for a python package installed in nvim virtualenv.
---@param command_name string
local function run_from_nvim_pyenv(command_name)
	local command_full_path = HOME .. "/.pyenv/versions/nvim/bin/" .. command_name
	return command_full_path
end
local function run_from_active_pyenv(command_name)
	local command_full_path = HOME .. "/.pyenv/versions/nvim/bin/" .. command_name
	return command_full_path
end

local active_pyenv_python = HOME .. "/.pyenv/shims/python"
null_ls.setup({
	diagnostics_format = "[#{s}|#{c}] #{m}",
	sources = {
		null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.diagnostics.mypy.with({
			command = run_from_active_pyenv("mypy"),
			extra_args = { "--python-executable", active_pyenv_python },
		}),
		null_ls.builtins.diagnostics.pydocstyle.with({
			command = run_from_active_pyenv("pydocstyle"),
			extra_args = { "--convention", "numpy" },
		}),
		null_ls.builtins.diagnostics.flake8.with({ command = run_from_active_pyenv("flake8") }),
		null_ls.builtins.formatting.black.with({ command = run_from_active_pyenv("black") }),
		null_ls.builtins.formatting.isort.with({
			command = run_from_active_pyenv("isort"),
			extra_args = { "--profile", "black" },
		}),
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.yamllint.with({ command = run_from_nvim_pyenv("yamllint") }),
	},
})
