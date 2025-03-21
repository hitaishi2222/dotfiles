return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },
  config = function()
    -- Diagnostic Config
    -- See :help vim.diagnostic.Opts
    vim.diagnostic.config({
      severity_sort = true,
      float = { border = "rounded", source = "if_many" },
      underline = { severity = vim.diagnostic.severity.ERROR },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "󰅚 ",
          [vim.diagnostic.severity.WARN] = "󰀪 ",
          [vim.diagnostic.severity.INFO] = "󰋽 ",
          [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
      } or {},
      virtual_text = {
        source = "if_many",
        spacing = 2,
        format = function(diagnostic)
          local diagnostic_message = {
            [vim.diagnostic.severity.ERROR] = diagnostic.message,
            [vim.diagnostic.severity.WARN] = diagnostic.message,
            [vim.diagnostic.severity.INFO] = diagnostic.message,
            [vim.diagnostic.severity.HINT] = diagnostic.message,
          }
          return diagnostic_message[diagnostic.severity]
        end,
      },
    })

    local capabilities = require("blink.cmp").get_lsp_capabilities()
    require("lspconfig").lua_ls.setup({ capabilities = capabilities })
    require("lspconfig").marksman.setup({ capabilities = capabilities })
    require("lspconfig").texlab.setup({ capabilities = capabilities })
    require("lspconfig").bashls.setup({ capabilities = capabilities })
    -- require("lspconfig").ltex.setup({ capabilities = capabilities })
    require("lspconfig").harper_ls.setup({
      filetypes = { "latex", "tex", "markdown", "txt" },
      settings = {
        ["harper-ls"] = {
          userDictPath = "",
          fileDictPath = "",
          linters = {
            SpellCheck = true,
            SpelledNumbers = false,
            AnA = true,
            SentenceCapitalization = true,
            UnclosedQuotes = true,
            WrongQuotes = false,
            LongSentences = true,
            RepeatedWords = true,
            Spaces = true,
            Matcher = true,
            CorrectNumberSuffix = true,
          },
          codeActions = {
            ForceStable = false,
          },
          markdown = {
            IgnoreLinkTitle = false,
          },
          diagnosticSeverity = "hint",
          isolateEnglish = false,
        },
      },
    })
    require("lspconfig").pylsp.setup({
      capabilities = capabilities,
      settings = {
        pylsp = {
          plugins = {
            mypy = {
              enabled = true,
              live_mode = false, -- Disables live checking for performance reasons
              dmypy = true, -- Use daemon mode for faster checks
            },
            rope = {
              enabled = true,
            },
            pyslp_rope = {
              enabled = true,
            },
            ruff = {
              enabled = true,
            },
          },
        },
      },
    })
  end,
}
