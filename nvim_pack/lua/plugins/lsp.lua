vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
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
    -- harper_ls on_init override
    on_init = function(client)
      client.offset_encoding = "utf-16"
    end,
  },
})

vim.lsp.enable({

  --python
  -- "pyright",
  "basedpyright",
  "ruff",

  -- lua
  "lua_ls",

  -- typst
  "tinymist",

  -- grammar
  "harper_ls",

  -- rust
  "rust_analyzer",

  -- bash
  "bashls",

  -- markdown (check better-one)
  "marksman",

  -- Latex
  "texlab",
})
