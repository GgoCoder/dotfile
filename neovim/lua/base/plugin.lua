vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
		--包管理插件
		use 'wbthomason/packer.nvim'

		--theme 主题
		use {'navarasu/onedark.nvim',
		config = function() require("config.onedark") end}

		--
		use {'nvim-tree/nvim-tree.lua',
		requires = {'nvim-tree/nvim-web-devicons'}, -- optional, for file icons 
		tag = 'nightly',-- optional, updated every week. (see issue #1193)
		config = function() require("config.nvim-tree") end} 
end)
