HISTFILE=~/.zshhist
HISTSIZE=1000
SAVEHIST=1000
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="fwalch"
DISABLE_AUTO_UPDATE="true"
plugins=(
    git
    zsh-autosuggestions
    fast-syntax-highlighting
    fzf
    zsh-interactive-cd
    vi-mode
)

VI_MODE_SET_CURSOR=true

source $ZSH/oh-my-zsh.sh

export EDITOR=nvim
export VISUAL=nvim
export PATH="$PATH:/home/me/.cargo/bin"
export FZF_DEFAULT_COMMAND='fd --type f -H'
export FZF_COMPLETION_TRIGGER='--'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias mv='mv -iv'
alias cp='cp -riv'
alias rm='rm -iv'
alias cat='bat -pp'

alias ..='cd ..'
alias x='exit'
alias ZZ='exit'
alias ZQ='exit'
alias la='echo " " && exa --long --recurse --tree --icons --binary --header --git --git-ignore /$PROJECT_NAME'
alias e='nvim'
alias vim='nvim'

echo "\nIn project $PROJECT_NAME on $(date +'%A %d/%m/%Y at %R')\n"
git status
la
echo ""
