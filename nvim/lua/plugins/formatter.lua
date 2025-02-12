return {
	"stevearc/conform.nvim",
	dependencies = { "mason.nvim" },
	lazy = true,
	cmd = "ConformInfo",
	keys = {
		{
			"<leader>F",
			function()
				require("conform").format()
			end,
			mode = { "n", "v" },
			desc = "Format Injected Langs",
		},
	},
	opts = { -- Direct `opts` table, no function wrapper
		format_on_save = { -- Optional: Format on save configuration
			lsp_format = "fallback",
			timeout_ms = 500,
		},
		formatters_by_ft = { -- Define formatters per filetype
			lua = { "stylua" },
			sh = { "shfmt" },
			javascript = { "prettier" },
			python = { "black" },
		},
	},
}
