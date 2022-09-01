### Use Zsh/ZLE in vi-mode
bindkey -v
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^N' menu-complete
bindkey '^P' reverse-menu-complete
export KEYTIMEOUT=1 # how long to wait after pressing modifier key (e.g. ESC)
