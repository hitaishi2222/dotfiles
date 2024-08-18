if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


export ZSH="$HOME/.oh-my-zsh"
export PATH=$HOME/.local/bin:$PATH
export PYENV_ROOT="$HOME/.pyenv"


plugins=(git sudo copypath copyfile command-not-found colorize python web-search 
          zsh-syntax-highlighting zoxide zsh-autosuggestions fzf-tab)

source $ZSH/oh-my-zsh.sh
source ~/powerlevel10k/powerlevel10k.zsh-theme


# Load completions
autoload -U compinit
compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

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

# unalias zi
# Aliases
alias c='clear'
alias cd="z"
alias ls='eza --icons=always'
alias py=/usr/bin/python3.12
alias python=/usr/bin/python3.12
alias python3=/usr/bin/python3.12
alias mpi4="mpirun -np 4"
alias dftf="cd /mnt/g/Learn_DFT/theory/qe_docs_examples"
alias nvim="/mnt/c/Program\ Files/Neovim/bin/nvim.exe"
alias vim="/mnt/c/Program\ Files/Neovim/bin/nvim.exe"


eval "$(fzf --zsh)"
eval "$(pyenv virtualenv-init -)"