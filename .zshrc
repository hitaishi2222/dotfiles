if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


plugins=(git sudo copypath copyfile command-not-found colorize python web-search 
          zsh-syntax-highlighting zoxide zsh-autosuggestions fzf-tab)

ZSH_THEME="powerlevel10k/powerlevel10k"

# Load completions
autoload -U compinit
compinit


export ZSH="$HOME/.oh-my-zsh"
export PATH=$HOME/.local/bin:$PATH
export PATH=:$PATH:/usr/local/bins
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/repo/prj
export PATH="$HOME/.cargo/bin:$PATH"


if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi


# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt hist_verify
setopt sharehistory
setopt appendhistory
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups
setopt hist_expire_dups_first

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward


# Completion styling
# zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --icons=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --icons=always $realpath'

alias c='clear'
alias cd="z"
alias ls='eza --icons=always'
alias mpi4="mpirun -np 4"
alias vim='nvim'
alias fabric='~/fabric'
alias fm6000='fm6000 -f ~/.arch_ascii.txt -c blue' 
alias pbpaste='xclip -selection clipboard -o'
alias cursor='~/Downloads/cursor-0.43.6x86_64.AppImage'
alias scls='simple-completion-language-server'

eval "$(zoxide init zsh)"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

source $ZSH/oh-my-zsh.sh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quite
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
# running FM6000 on startup
fm6000

# bun completions
[ -s "/home/hiti/.bun/_bun" ] && source "/home/hiti/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
