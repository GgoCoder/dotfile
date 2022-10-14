local api = vim.api
local buf, win
local position

local function center(str)
	local width = api.nvim_win_get_width(0)
	local shift = math.floor(width / 2) - math.floor(string.len(str) / 2)
	return string.rep(' ', shift) .. str
end


local function open_windows()

	buf = api.nvim_create_buf(false, true)
	api.nvim_buf_set_option(buf, "bufhidden", "wipe")
	local border_buf = api.nvim_create_buf(false, true)
	--获取尺寸
	local width = api.nvim_get_option("columns")
	local height = api.nvim_get_option("lines")
	print(width, height)
	--计算浮动窗口的大小
	local win_height = math.ceil(height * 0.8 +4)
	local win_width = math.ceil(width * 0.8 +4)
	print(win_height, win_width)

	--计算起始位置
	local row = math.ceil((height - win_height)/2 -1)
	local col = math.ceil((width - win_width)/2)
	print(row,col)

	--设置一些选项
	local opts ={
		style = "minimal",
		relative = "editor",
		width = win_width,
		height = win_height,
		row = row,
		col = col,
	}

	win = api.nvim_open_win(buf, true, opts)

	local border_opts = {
		style = "minimal",
		relative = "editor",
		width = win_width + 2,
		height = win_height + 2,
		row = row - 1,
		col = col - 1,

	}

	local border_lines = {'╔' .. string.rep('═', win_width) .. '╗'}
	local middle_line = '║' .. string.rep(' ', win_width) .. '║'
	for i =1, win_height do
		table.insert(border_lines, middle_line)
	end
	table.insert(border_lines, '╚' .. string.rep('═', win_width) .. '╝')

	api.nvim_buf_set_lines(border_buf, 0, -1, false, border_lines)

	local border_win = api.nvim_open_win(border_buf, true, border_opts)
	win = api.nvim_open_win(buf, true , opts)

	api.nvim_command('au BufWipeout <buffer> exe "silent bwipeout! "'..border_buf)
	api.nvim_buf_set_lines(buf, 0, -1, false, { center('What have i done?'), '', ''})
	api.nvim_buf_add_highlight(buf, -1, 'WhidHeader', 0, 0, -1)
end

local function update_view()
	api.nvim_buf_set_option(buf, "modifiable", true)
	--position = position + direction

	local result = vim.cmd("colorscheme ")

	if #result == nil then
		table.insert(result, "")
	end
end
update_view()
--open_windows()
