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
	--[[
  {
    "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    vim.cmd("colorscheme rose-pine")
    -- to remove '~'
    vim.cmd("hi EndOfBuffer guibg=bg guifg=bg")
  end,
  }
  --]]
}
