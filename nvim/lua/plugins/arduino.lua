return {
  vim.api.nvim_create_user_command("ArduinoCompile", function()
    vim.cmd("!arduino-cli compile --fqbn arduino:renesas_uno:unor4wifi  %:p:h")
  end, {}),
  vim.api.nvim_create_user_command("ArduinoUpload", function()
    vim.cmd("!arduino-cli upload -p /dev/ttyACM0 --fqbn arduino:renesas_uno:unor4wifi %:p:h")
  end, {}),
  vim.keymap.set("n", "<leader>ac", ":ArduinoCompile<CR>", { desc = "Compile Arduino Sketch" }),
  vim.keymap.set("n", "<leader>au", ":ArduinoUpload<CR>", { desc = "Upload Arduino Sketch" }),
}
