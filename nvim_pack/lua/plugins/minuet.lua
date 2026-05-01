vim.pack.add({
  { src = "https://github.com/milanglacier/minuet-ai.nvim" },
})
require("minuet").setup({
  -- top level options
  provider = "openai_fim_compatible",
  context_window = 512,
  throttle = 1000,
  debounce = 400,
  n_completions = 1,

  provider_options = {
    openai_fim_compatible = {
      api_key = "TERM",
      name = "Ollama",
      end_point = "http://localhost:11434/v1/completions",
      model = "qwen2.5-coder:3b",
      optional = {
        -- max_tokens = 56,
        -- top_p = 0.9,
      },
    },
  },

  -- virtualtext only contains UI/keymap options
  virtualtext = {
    auto_trigger_ft = { "*" },
    keymap = {
      accept = "<Tab>",
      accept_line = "<A-a>",
      accept_n_lines = "<A-z>",
      prev = "<A-[>",
      next = "<A-]>",
      dismiss = "<A-e>",
    },
  },
})

-- openai_fim_compatible = {
--   api_key = "TERM",
--   name = "Llama.cpp",
--   end_point = "http://localhost:2000/v1/completions",
--   model = "Llama.cpp",
--   template = {
--     prompt = function(context_before_cursor, context_after_cursor, _)
--       return "<|fim_prefix|>"
--         .. context_before_cursor
--         .. "<|fim_suffix|>"
--         .. context_after_cursor
--         .. "<|fim_middle|>"
--     end,
--     suffix = false,
--   },
--   optional = {
--     max_tokens = 64,
--     temperature = 0.1,
--     stop = { "<|endoftext|>" },
--   },
-- },
