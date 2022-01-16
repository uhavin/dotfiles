local HOME = vim.fn.expand("$HOME")
local null_ls = require("null-ls")

function nvim_python_command(executable)
	executable_path = HOME .. "/.pyenv/versions/nvim/bin/" .. executable
	return executable_path
end

project_python = HOME .. "/.pyenv/shims/python"

null_ls.setup({
	diagnostics_format = "#[{s}|#{c}] #{m}",
	sources = {
		null_ls.builtins.diagnostics.mypy.with({
			command = nvim_python_command("mypy"),
			extra_args = { "--python-executable", project_python },
		}),
		null_ls.builtins.diagnostics.flake8.with({ command = nvim_python_command("flake8") }),
		null_ls.builtins.formatting.black.with({ command = nvim_python_command("black") }),
		null_ls.builtins.formatting.isort.with({ command = nvim_python_command("isort") }),
		null_ls.builtins.formatting.stylua,
	},
})
