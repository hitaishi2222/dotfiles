vim.pack.add({
  { src = "https://github.com/maxpaulus43/llama-cmp.nvim" },
})

require("llama-cmp").setup({
  model = "qwen2.5-coder:1.5b",
})
