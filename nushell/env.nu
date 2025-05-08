$env.config.show_banner = false
$env.config.buffer_editor = 'nvim'

#PATHS
let HOME = $nu.home-path
$env.Path = ($env.Path | prepend '/usr/local/bins')
$env.Path = ($env.Path | append $'($HOME)/.local/bin')
$env.PYENV_ROOT = "~/.pyenv"
$env.Path = ($env.Path | append $'($env.PYENV_ROOT)/bin')
$env.Path = ($env.Path | append $'($HOME)/.cargo/bin')
$env.Path = ($env.Path | append $'($HOME)/.go/bin')
$env.Path = ($env.Path | append $'($HOME)/Hiti/dotfiles/scripts')
$env.Path = ($env.Path | append $'($HOME)/Downloads/installers/qe-7.4.1/bin')
$env.WORKON_HOME = "~/.virtualenvs"
$env.PYTHONPATH = "/usr/lib/freecad/lib/"
$env.PYTHONPATH = ($env.PYTHONPATH | append "/home/hiti/Downloads/installers/meep/python")

zoxide init --cmd cd nushell | save -f ~/.zoxide.nu
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu

