alias d='docker $*'

alias d-c='docker-compose $*'

alias docker-clean=" \
  docker container prune -f ; \
  docker image prune -f ; \
  docker network prune -f ; \
  docker volume prune "
