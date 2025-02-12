return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd("colorscheme catppuccin-mocha")
			vim.cmd("hi EndOfBuffer guibg=bg guifg=bg")
		end,
	},
	{
		"rose-pine/neovim",
		lazy = true,
		name = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
			-- to remove '~'
			vim.cmd("hi EndOfBuffer guibg=bg guifg=bg")
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = true,
		-- priority = 1000,
		opts = {},
	},
	{
		"rebelot/kanagawa.nvim",
		"mhartington/oceanic-next",
		"oxfist/night-owl.nvim",
	},
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
}
