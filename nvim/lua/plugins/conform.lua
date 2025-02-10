return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		latex = { "latexindent", "tex-fmt" },
		rust = { "rustfmt", lsp_format = "fallback" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_format = "fallback",
	},
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>F",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
}
