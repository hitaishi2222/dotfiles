set -g fish_greeting
fish_vi_key_bindings

alias v="nvim ."
alias c="clear"
alias cd="z"
alias lg="lazygit"
alias py="python3"
alias ls="eza --icons"
alias zed="zeditor"

# variables
set -x QT_QPA_PLATFORMTHEME "qt6ct"
set -x PYENV_ROOT $HOME/.pyenv/versions/3.13.7/
set -x PYTHONPATH "/usr/lib/freecad/lib" "/home/hiti/Downloads/installers/meep/python"

set -x EDITOR "nvim"
set -x OLLAMA_HOST "http://localhost:11434/"
set -x LOCAL_ENDPOINT "http://localhost:11434/api/chat"
set -x CARGO_TARGET_DIR "/home/hiti/.cargo/bin"
set -x TMPDIR "/tmp"

# paths
fish_add_path --append --path ~/Hiti/dotfiles/scripts/

# carapace
set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense'
carapace _carapace fish | source

# pyenv
fish_add_path --append --path $PYENV_ROOT/bin
pyenv init - fish | source

starship init fish | source
zoxide init fish | source

