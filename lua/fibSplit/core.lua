local M = {}

local function get_normal_windows()
	local normal_wins = {}
	for _, win_id in ipairs(vim.api.nvim_list_wins()) do
		local conf = vim.api.nvim_win_get_config(win_id)
		if conf.relative == "" then
			table.insert(normal_wins, win_id)
		end
	end
	return normal_wins
end

function M.fibsplit(file_path)
	local normal_wins = get_normal_windows()

	vim.cmd("set noequalalways")
	if #normal_wins == 0 then
		vim.notify("No normal windows found!", vim.log.levels.ERROR)
		return
	end

	local old_bufs = {}
	for i, w in ipairs(normal_wins) do
		old_bufs[i] = vim.api.nvim_win_get_buf(w)
	end

	local new_buf
	if file_path and file_path ~= "" then
		vim.api.nvim_set_current_win(normal_wins[1])
		vim.cmd("edit " .. vim.fn.fnameescape(file_path))
		new_buf = vim.api.nvim_get_current_buf()
	else
		new_buf = vim.api.nvim_create_buf(false, true)
		if not new_buf then
			vim.notify("Failed to create new buffer!", vim.log.levels.ERROR)
			return
		end
		vim.api.nvim_win_set_buf(normal_wins[1], new_buf)
	end

	for i = #normal_wins, 2, -1 do
		vim.api.nvim_win_set_buf(normal_wins[i], old_bufs[i - 1])
	end

	local last_win = normal_wins[#normal_wins]
	vim.api.nvim_set_current_win(last_win)

	if #normal_wins % 2 == 0 then
		vim.api.nvim_command("split")
	else
		vim.api.nvim_command("vsplit")
	end

	local new_split_win = vim.api.nvim_get_current_win()
	local last_original_buf = old_bufs[#normal_wins]
	vim.api.nvim_win_set_buf(new_split_win, last_original_buf)

	-- Ensure the new buffer is the current buffer
	vim.api.nvim_set_current_win(normal_wins[1])
	vim.api.nvim_set_current_buf(new_buf)

	return {
		new_buf = new_buf,
		windows_shifted = #normal_wins - 1,
	}
end

function M.fibPop()
	local normal_wins = get_normal_windows()

	if #normal_wins == 0 then
		vim.notify("No normal windows found!", vim.log.levels.ERROR)
		return
	end

	local old_bufs = {}
	for i, w in ipairs(normal_wins) do
		old_bufs[i] = vim.api.nvim_win_get_buf(w)
	end
	local current_buf = vim.api.nvim_get_current_buf()
	local current_win = vim.api.nvim_get_current_win()

	local i = 1

	while normal_wins[i] and current_win ~= normal_wins[i] do
		vim.api.nvim_win_set_buf(normal_wins[i], old_bufs[i - 1])
		i = i + 1
	end

	vim.api.nvim_win_set_buf(normal_wins[1], current_buf)
	-- Ensure the new buffer is the current buffer
	vim.api.nvim_set_current_win(normal_wins[1])
end
return M
