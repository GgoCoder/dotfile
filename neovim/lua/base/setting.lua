-- option
-- tab 四个空格
vim.o.tabstop = 4
-- 编码格式utf-8
vim.o.encoding = "utf-8"
-- 自动匹配
vim.o.showmatch = true

-- 鼠标操作
vim.o.mouse = ""

-- global
vim.g.mapleader = " "

vim.keymapping = {
	smap = vim.api.nvim_set_keymap,
	dmap = vim.api.nvim_del_keymap,
	bsmap = vim.api.nvim_buf_set_keymap,
	bdmap = vim.api.nvim_buf_del_keymap,
	opt = {noremap = true, silent = true}
}
