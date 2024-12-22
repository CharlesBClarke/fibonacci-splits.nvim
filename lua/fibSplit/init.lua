local core = require("fibSplit.core")

local M = {}

M.fibSplit = core.fibsplit

-- Register the `:fibsplit` command
vim.api.nvim_create_user_command("Fibsplit", function(opts)
	core.fibsplit(opts.args)
end, {
	nargs = "?",
	desc = "Fibonacci Split: Splits the current window and optionally opens a file",
})

return M
