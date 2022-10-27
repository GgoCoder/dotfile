-- https://github.com/navarasu/onedark.nvim

local theme_array = {"onedark", "github_light_default", "sacredforest"}

local function load_default_theme()
	vim.cmd.colorscheme("default")
end

local function load_one_dark_theme()
	load_default_theme()
	require("onedark").setup({
		style="dark", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
		transparent=true, -- show/hide background

	})
	require("onedark").load()
end

local function load_github_light_theme()
	load_default_theme()
	vim.cmd.colorscheme("github_light_default")
end

local function load_sacredforest_theme()
	load_default_theme()
	vim.cmd.colorscheme("sacredforest")
	vim.o.termguicolors = true
end

local switch = {
	[1] = function ()
		load_one_dark_theme()
	end,
	[2] = function ()
		load_github_light_theme()
	end,
	[3] = function ()
		load_sacredforest_theme()
	end
}

local function get_random_theme()
	local count = 0
	for k, v in pairs(theme_array) do
		count = count + 1
	end
	math.randomseed(os.time())
	local a = math.random(count)
	local f = switch[a]
	if(f) then
		f()
	else
		load_one_dark_theme()
	end
end


get_random_theme()
