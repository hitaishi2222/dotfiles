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

    -- vim.lsp.enable("ty")
    vim.lsp.enable("mypy")
    vim.lsp.enable("pyright")
    vim.lsp.enable("ruff")
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    require("lspconfig").lua_ls.setup({ capabilities = capabilities })
    require("lspconfig").marksman.setup({ capabilities = capabilities })
    require("lspconfig").texlab.setup({ capabilities = capabilities })
    require("lspconfig").bashls.setup({ capabilities = capabilities })
    require("lspconfig").rust_analyzer.setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      end,
    })
    require("lspconfig").tinymist.setup({
      capabilities = capabilities,
      settings = {
        exportPdf = "onType",
      },
      on_attach = function(client, bufnr)
        vim.keymap.set("n", "<leader>tp", function()
          client:exec_cmd({
            title = "pin",
            command = "tinymist.pinMain",
            arguments = { vim.api.nvim_buf_get_name(0) },
          }, { bufnr = bufnr })
        end, { desc = "[T]inymist [P]in", noremap = true })

        vim.keymap.set("n", "<leader>tu", function()
          client:exec_cmd({
            title = "unpin",
            command = "tinymist.pinMain",
            arguments = { vim.v.null },
          }, { bufnr = bufnr })
        end, { desc = "[T]inymist [U]npin", noremap = true })
      end,
    })
    require("lspconfig").harper_ls.setup({
      settings = {
        ["harper-ls"] = {
          userDictPath = "/home/hiti/Hiti/dict.txt",
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
            ForceStable = true,
          },
          markdown = {
            IgnoreLinkTitle = false,
          },
          diagnosticSeverity = "hint",
          isolateEnglish = false,
        },
      },
    })
    local cap = vim.lsp.protocol.make_client_capabilities()
    cap.textDocument.completion.completionItem.snippetSupport = true

    vim.lsp.config("cssls", {
      capabilities = { capabilities, cap },
    })
    vim.lsp.config("html", {
      capabilities = { capabilities, cap },
      filetypes = { "html", "markdown" },
    })
    vim.lsp.config("tailwindcss", {
      capabilities = { capabilities, cap },
    })
    vim.lsp.config("emmet_ls", {
      capabilities = { capabilities, cap },
      filetypes = { "html", "markdown" },
    })

    vim.lsp.enable("html")
    vim.lsp.enable("tailwindcss")
    vim.lsp.enable("mypy")
    vim.lsp.enable("emmet_ls")
  end,
}
