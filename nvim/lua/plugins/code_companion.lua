return {
  "olimorris/codecompanion.nvim",
  -- enabled = false,
  config = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    log_level = "DEBUG",
    adapters = {
      ollama = "ollama",
      codellama = function()
        return require("codecompanion.adapters").extend("ollama", {
          env = {
            url = "http://localhost:11434",
            chat_url = "/api/generate",
            models_endpoint = "/api/tags",
          },
          name = "codellama:latest", -- Give this adapter a different name to differentiate it from the default ollama adapter
          schema = {
            model = {
              default = "codellama:latest",
            },
          },
        })
      end,
    },
    strategies = {
      --NOTE: Change the adapter as required
      chat = { adapter = "codellama" },
      inline = {
        adapter = "codellama",
        keymaps = {
          accept_change = {
            modes = { n = "ga" },
            description = "Accept the suggested change",
          },
          reject_change = {
            modes = { n = "gr" },
            description = "Reject the suggested change",
          },
        },
      },
    },
  },
}
