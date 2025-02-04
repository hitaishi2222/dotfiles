return {
	"echasnovski/mini.nvim",
	version = false,
	enable = true,
	config = function()
		require("mini.ai").setup()
		require("mini.pairs").setup()
		require("mini.comment").setup()
		require("mini.surround").setup()
		require("mini.bracketed").setup()
		-- require("mini.completion").setup()

		require("mini.icons").setup()
		-- require("mini.notify").setup()
		require("mini.starter").setup()
		require("mini.tabline").setup({})
		require("mini.animate").setup()
		require("mini.statusline").setup({ use_icons = true })
		require("mini.basics").setup({ mappings = { windows = true } })
	end,
}
