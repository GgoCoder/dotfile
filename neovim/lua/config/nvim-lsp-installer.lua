local lsp_installer_servers = require("nvim-lsp-installer.servers")

local servers = {
	sumneko_lua = require("lsp.sumneko_lua"),
	gopls = require("lsp.gopls"),
}

local function attach(_, buffer)
	--go to definitions
	vim.keymapping.bsmap(buffer, "n", "gd", "<cmd>Telescope lsp_definitions theme=dropdown<CR>", vim.keymapping.opts)
	--查找引用
	vim.keymapping.bsmap(buffer, "n", "gr", "<cmd>Telescope lsp_references theme=dropdown<CR>", vim.keymapping.opts)
	--显示代码可用的操作
	vim.keymapping.bsmap(buffer, "n", "<leader>ca", "<cmd>Telescope lsp_code_actions theme=dropdown<CR>", vim.keymapping.opts)
end

for server_name, server_option in pairs(servers) do
	local server_available, server = lsp_installer_servers.get_server(server_name)
	if server_available then
		server:on_ready(
			function()
				server_option.on_attach = attach
				server:setup(server_option)
			end
		)
		if not server:is_installed() then
			server:install()
		end
	end
end
