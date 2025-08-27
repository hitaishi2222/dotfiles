#!/usr/bin/env bash

fzf="fzf --height 40% --layout reverse --border" 

list_options=$(echo "dependencies basic recomemded rust_tools advanced" | tr " " "\n")

option=$(printf "$list_options" | $fzf)
echo $option

if [[ $option == "dependencies" ]]; then
    sudo pacman -S --noconfirm base-devel wl-clipboard gtkmm3 jsoncpp libsigc++ fmt wayland chrono-date spdlog gtk3 gobject-introspection libgirepository libpulse libnl libappindicator-gtk3 libdbusmenu-gtk3 libmpdclient sndio libevdev libxkbcommon upower meson cmake scdoc wayland-protocols glib2-devel
fi

sudo pacman -S --noconfirm git github-cli lazygit neovim rofi-wayland ghostty fzf rustup npm tmux waybar
