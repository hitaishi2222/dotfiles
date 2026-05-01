vim.keymap.set("v", "<leader>N", function()
  -- Yank selection into register 'v'
  vim.cmd('noau normal! "vy')
  local selection = vim.fn.getreg("v")

  -- Run numbat
  local result = vim.fn.system({ "numbat", "-e", selection })
  result = result:gsub("%s+$", "")

  if vim.v.shell_error ~= 0 then
    vim.notify("numbat error: " .. result, vim.log.levels.ERROR)
    return
  end

  -- Replace selection with result
  local bufnr = vim.api.nvim_get_current_buf()
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local sr, sc = start_pos[2] - 1, start_pos[3] - 1
  local er = end_pos[2] - 1

  -- Clamp ec to actual line length to avoid out-of-range
  local line = vim.api.nvim_buf_get_lines(bufnr, er, er + 1, false)[1] or ""
  local ec = math.min(end_pos[3], #line)

  vim.api.nvim_buf_set_text(bufnr, sr, sc, er, ec, { result })
end, { noremap = true, silent = true, desc = "Evaluate selection with numbat" })
