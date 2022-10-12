local lsp_installer_servers = require("nvim-lsp-installer.servers")

local servers = {
	sumneko_lua = require("lsp.sumneko_lua"),
	gopls = require("lsp.gopls"),
}

local function attach(_, buffer)
	--go to definitions
	vim.keymapping.bsmap(buffer, "n", "gd", "<cmd>Telescope lsp_definitions theme=dropdown<CR>", vim.keymapping.opts)
end
