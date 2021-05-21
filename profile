# Environment variables
export EDITOR=nvim
export VISUAL=nvim
export PATH="$PATH:/home/me/.local/bin"
export LANG=en_US.UTF-8
export LC_COLLATE=C
export DISABLE_AUTO_TITLE='true'
export FZF_DEFAULT_COMMAND='fd --type f -H'
export FZF_COMPLETION_TRIGGER='--'

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias mv='mv -iv'
alias cp='cp -riv'
alias rm='rm -iv'
alias cat='bat -pp'
alias tmux='tmux -2'

alias ..='cd ..'
alias x='tmux kill-server'
alias ZZ='exit'
alias ZQ='exit'
alias la='echo " " && exa --long --recurse --tree --icons --binary --header --git --git-ignore --sort extension /$PROJECT_NAME'
alias e='nvim'
alias vim='nvim'
alias stat='echo "\nWelcome to $PROJECT_NAME\n" && git status && la'
alias help='bat ${HOME}/README.md'
