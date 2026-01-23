$env.EDITOR = "nvim"
$env.LOCAL_ENDPOINT = "http://localhost:11434/api/chat"
$env.config.show_banner = false
$env.config.buffer_editor = 'nvim'
$env.config = {
  edit_mode: vi
  cursor_shape: {
    vi_insert: "line"
    vi_normal: "block"
  }
}
$env.PROMPT_INDICATOR_VI_NORMAL = ""
$env.PROMPT_INDICATOR_VI_INSERT = ""


#PATHS
let HOME = $nu.HOME
$env.Path = ($env.Path | prepend '/usr/local/bins')
$env.Path = ($env.Path | append $'($HOME)/go/bin/')
$env.Path = ($env.Path | append $'($HOME)/.local/bin')
$env.Path = ($env.Path | append $'($HOME)/.cargo/bin')
$env.Path = ($env.Path | append $'($HOME)/Hiti/dotfiles/scripts')
$env.Path = ($env.Path | append $'($HOME)/Hiti/dotfiles/scripts/rofi_scripts')
$env.Path = ($env.Path | append $'($HOME)/Downloads/installers/qe-7.4.1/bin')
$env.WORKON_HOME = "~/.virtualenvs"
$env.PYTHONPATH = "/usr/lib/freecad/lib/"
$env.PYTHONPATH = ($env.PYTHONPATH | append "/home/hiti/Downloads/installers/meep/python/meep/")
$env.LD_LIBRARY_PATH = "/usr/local/lib"

#PYENV 
$env.PYENV_ROOT = ($env.HOME | path join ".pyenv")
$env.PATH = ($env.PATH | prepend ($env.PYENV_ROOT | path join "bin"))

source ~/.cache/carapace/init.nu
#PLUGINS
## highlight
$env.config.plugins.highlight.true_colors = true
$env.config.plugins.highlight.theme = "GitHub"
#clipboard
$env.config.plugins.clipboard.NO_DAEMON = true

zoxide init --cmd cd nushell | save -f ~/.zoxide.nu

