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
    --Enable (broadcasting) snippet capability for completion
    local cap = vim.lsp.protocol.make_client_capabilities()
    cap.textDocument.completion.completionItem.snippetSupport = true

    vim.lsp.config("cssls", { capabilities = cap })
    vim.lsp.config("html", { capabilities = cap, filetypes = { "html", "markdown" } })
    vim.lsp.config("emmet_ls", { capabilities = cap, filetypes = { "html", "markdown" } })

    vim.lsp.config("pyright", {
      cmd = { "/home/hiti/.pyenv/shims/pyright-langserver", "--stdio" },
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            diagnosticMode = "openFilesOnly",
            useLibraryCodeForTypes = true,
          },
        },
      },
    })
    vim.lsp.config("tinymist", {
      settings = {
        -- exportPdf = "onType",
        formatterMode = "typstyle",
        lint = true,
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
    vim.lsp.config("rust_analyzer", {
      settings = {
        ["rust-analyzer"] = {
          diagnostics = {
            enable = false,
          },
        },
      },
      on_attach = function(client, bufnr)
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      end,
    })
    vim.lsp.config("harper_ls", {
      settings = {
        ["harper-ls"] = {
          userDictPath = "/home/hiti/Hiti/dict.txt",
          linters = {
            SpellCheck = true,
          },
          codeActions = {
            ForceStable = true,
          },
        },
      },
    })
    -- vim.lsp.config("arduino_language_server", {
    --   filetypes = { "ino", "arduino" },
    --   cmd = {
    --     "arduino-language-server",
    --     "-cli",
    --     "/usr/bin/arduino-cli",
    --     "-cli-config",
    --     vim.fn.expand("~/.arduino15/arduino-cli.yaml"),
    --     "-clangd",
    --     "/usr/bin/clangd",
    --     "-fqbn",
    --     "arduino:renesas_uno:unor4wifi",
    --   },
    -- })
    vim.lsp.enable({
      "pyrefly",
      "lua_ls",
      "marksman",
      "texlab",
      "bashls",
      "ruff",
      "tinymist",
      "rust_analyzer",
      "html",
      -- "tailwindcss",
      "emmet_ls",
      "harper_ls",
      -- "arduino_language_server",
      "clangd",
    })
  end,
}
