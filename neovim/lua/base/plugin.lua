vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
	--包管理插件
	use 'wbthomason/packer.nvim'

	--theme 主题
	use {'navarasu/onedark.nvim',
	config = function() require("config.onedark") end}

	-- 大纲树
	use {'nvim-tree/nvim-tree.lua',
	requires = {'nvim-tree/nvim-web-devicons'}, -- optional, for file icons 
	tag = 'nightly',-- optional, updated every week. (see issue #1193)
	config = function() require("config.nvim-tree") end}

	-- 代码颜色高亮
	use {'nvim-treesitter/nvim-treesitter',
	config = function() require("config.nvim-treesitter")end}

	-- 括号自动补全
	use {'windwp/nvim-autopairs',
	config = function() require("config.nvim-autopairs")end}

	-- 代码自动补全
	use{'hrsh7th/nvim-cmp',
	requires={ 	{"onsails/lspkind-nvim"}, -- 为补全添加类似 vscode 的图标
				{"hrsh7th/vim-vsnip"}, -- vsnip 引擎，用于获得代码片段支持
				{"hrsh7th/cmp-vsnip"}, -- 适用于 vsnip 的代码片段源
				{"hrsh7th/cmp-nvim-lsp"}, -- 替换内置 omnifunc，获得更多补全
                {"hrsh7th/cmp-path"}, -- 路径补全
            	{"hrsh7th/cmp-buffer"}, -- 缓冲区补全
                {"hrsh7th/cmp-cmdline"}, -- 命令补全
                {"f3fora/cmp-spell"}, -- 拼写建议
                {"rafamadriz/friendly-snippets"}, -- 提供多种语言的代码片段
                {"lukas-reineke/cmp-under-comparator"} -- 让补全结果的排序更加智能}}
			},
	config = function() require("config.nvim-cmp")end}

	--自动安装lsp服务
	use {"williamboman/nvim-lsp-installer",
	config = function() require("config.nvim-lsp-installer") end}

	--- lsp 配置
	use {"neovim/nvim-lspconfig",
	config = function() require("config.nvim-lspconfig")end}

	-- telescope 
	use {"nvim-telescope/telescope.nvim",
	tag = '0.1.0',
	requires = {{"nvim-lua/plenary.nvim"}},
	config = function() require("config.telescope") end}

	-- 状态栏
	use {"windwp/windline.nvim",
	config = function() require("config.windline") end}

end)
