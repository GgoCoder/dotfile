local Toggleterm = require("toggleterm")
Toggleterm.setup({
	-- 默认新终端为插入模式
	start_in_insert = true,
	-- 新终端大小为
	size = 6,
	on_open = function ()
		vim.cmd("setlocal nospell")
	end
})

local Terminal = require("toggleterm.terminal").Terminal

local function deleteEscMap()
	vim.keymapping.dmap("t", "<Esc>")
end

local floatTerm = Terminal:new({
	hidden = true,
	direction = "float",
	float_opts = {
		border = "double"
	},
	on_open = function(term)
		deleteEscMap()
		vim.keymapping.bsmap(term.bufnr, "t", "<Esc>", "<C-\\><C-n>:close<CR>",vim.keymapping.opts)
	end,
	on_close = function()
		vim.keymapping.smap("t", "<Esc>", "<C-\\><C-n>", vim.keymapping.opts)
	end
})

Toggleterm.float_toggle = function ()
	floatTerm:toggle()
end

vim.keymapping.smap("t", "<Esc>", "<C-\\><C-n>", vim.keymapping.opts)
vim.keymapping.smap("n", "<leader>tf", "<cmd>lua require('toggleterm').float_toggle()<CR>", vim.keymapping.opts)
