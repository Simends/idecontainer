HISTFILE=~/.zshhist
HISTSIZE=1000
SAVEHIST=1000
export ZSH=$HOME/.oh-my-zsh
DISABLE_AUTO_UPDATE="true"

ZSH_THEME="fwalch"
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
source $HOME/.profile
