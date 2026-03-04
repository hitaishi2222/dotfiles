vim.pack.add({

  { src = "https://github.com/j-hui/fidget.nvim" },
  { src = "https://github.com/sphamba/smear-cursor.nvim" },
  { src = "https://github.com/arnamak/stay-centered.nvim" },
  { src = "https://github.com/norcalli/nvim-colorizer.lua" },
  { src = "https://github.com/mechatroner/rainbow_csv" },
  { src = "https://github.com/folke/flash.nvim" },
  { src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/folke/which-key.nvim" },
  { src = "https://github.com/linux-cultist/venv-selector.nvim" },

  -- {src = "https://github.com/leseixas/quantum_espresso-vim"},
  -- {src = "https://github.com/github/copilot.vim"},
})

require("fidget").setup({})
require("smear_cursor").setup({
  stiffness = 0.8,
  trailing_stiffness = 0.5,
  damping = 0.6,
  hide_target_hack = true,
})
require("flash").setup({})
require("tiny-inline-diagnostic").setup({})
require("stay-centered").setup({})
require("venv-selector").setup({})

-- Disable default LSP virtual text
vim.diagnostic.config({
  virtual_text = false,
})

local map = vim.keymap.set

-- Flash Keymaps
map({ "n", "x", "o" }, "s", function()
  require("flash").jump()
end, { desc = "Flash" })

map({ "n", "x", "o" }, "S", function()
  require("flash").treesitter()
end, { desc = "Flash Treesitter" })

map("o", "r", function()
  require("flash").remote()
end, { desc = "Remote Flash" })

map({ "o", "x" }, "R", function()
  require("flash").treesitter_search()
end, { desc = "Treesitter Search" })

map("c", "<C-sf>", function()
  require("flash").toggle()
end, { desc = "Toggle Flash Search" })

-- whichkey Keymaps
map("n", "<leader>?", function()
  require("which-key").show({ global = false })
end, { desc = "Buffer Local Keymaps (which-key)" })

map("n", "<leader>cc", "<cmd>ColorizerToggle<cr>", { desc = "Coloriszer Toggle" })
map("n", ",v", "<cmd>VenvSelect<cr>", { desc = "python virtual env select" })
