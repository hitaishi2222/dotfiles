mkdir ($nu.data-dir | path join "vendor/autoload")

$env.config.buffer_editor = "nvim"

# alias
alias c = clear
alias v = nvim .


$env.config.show_banner = false
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
