return {
  "iamcco/markdown-preview.nvim",
  enabled = false,
  build = "cd app ; npm install",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
    vim.g.mkdp_auto_start = 1
  end,
}
