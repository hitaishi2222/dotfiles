# ALIAS
alias c = clear
alias v = nvim .

$env.config.show_banner = false

source ~/.zoxide.nu

source ~/.cache/carapace/init.nu

# STARSHIP
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
