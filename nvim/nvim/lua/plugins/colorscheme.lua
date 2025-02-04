return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		vim.cmd("colorscheme rose-pine")
		-- to remove '~'
		vim.cmd("hi EndOfBuffer guibg=bg guifg=bg")
	end,
}
