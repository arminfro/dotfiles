alias reload!='. ~/.zshrc'

alias ls='exa --icons -s changed'

alias vterm="vim term://zsh"
alias journal-follow="journalctl -b -f | ccze -A -o nolookups"
alias ge="git edit"
alias update-vim="nvim +PlugUpgrade +PlugClean +PlugUpdate +PlugInstall +UpdateRemotePlugins"
alias feh="feh -ZxF"
alias docker-clean=" \
  docker container prune -f ; \
  docker image prune -f ; \
  docker network prune -f ; \
  docker volume prune -f "

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
