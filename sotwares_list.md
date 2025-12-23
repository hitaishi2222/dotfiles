# Software I have been using lately

OS / Distro -> Arch Linux
Login/Greeter -> greetd
Window Manager -> Hyprland
Browser -> Zen
Terminal -> Ghostty
Terminal Multiplexer -> Tmux
Shell -> Nushell with starship prompt
Keyboard Keys Manager -> Kanata
Font -> JetBrains Mono Nerd Font
Editor -> Neovim
Aplication Launcher -> rofi-wayland
REPL -> VS Code
Status Bar -> Waybar
Audio -> Pulsewire with hyprpwcenter
Terminal Music Player -> RMPC (MPD Backend)
Clipboard Manager -> Clipcat (Rust)
Screenshot Manager -> grimblast
Wallpaper Manager -> Hyprpaper
Color picker Manager -> hyprpicker
Color-Theme Config -> Wallust (rust)
Wallpaper-Picker -> script with fzf
Pdf reader -> Okular
Notes & plans -> Obsidian
Image Viewer -> Ristretto
Termianl file-manager -> Yazi
File manager -> dolphin
GTK-Theme -> Orchis
Linux-Mobile Link -> PC Link (FOSS)

-> Install tinymist through:
cargo install --git https://github.com/Myriad-Dreamin/tinymist --locked tinymist-cli

-> Freecad Changes to work in hyprland:
Go to `/usr/share/applications/org.freecad.FreeCAD.desktop` and change: Exec=env QT_QPA_PLATFORM=xcb freecad %F
