-- Pull in the wezterm API
local wezterm = require("wezterm")
local mux = wezterm.mux
-- This will hold the configuration.
local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.default_prog = {"wsl", "-e", "zsh"}
config.initial_cols = 100
config.initial_rows = 30

-- This is where you actually apply your config choices
-- config.color_scheme = 'Ayu Mirage'
-- config.color_scheme = 'Helios (base16)'
config.color_scheme = 'Cai (Gogh)'

config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 14
config.default_cwd = "//wsl.localhost/Ubuntu/home/hiti/"
config.window_decorations = "RESIZE"

config.enable_tab_bar = false
config.window_background_opacity = 0.95

wezterm.on('gui-startup', function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or
      {position={x=30,y=50},width=140,height=30}) -- ←these should be width=100%
  end)

-- and finally, return the configuration to wezterm
return config