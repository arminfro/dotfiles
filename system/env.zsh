# export TERMINAL=termite
# export EDITOR=nvim
# export SUDO_EDITOR=nvim
# export VISUAL=nvim
# export PAGER=/usr/bin/nvimpager && alias less=$PAGER
# export LANG=en_US.UTF-8
# export LANGUAGE=en_US.UTF-8
export GEM_PATH=$(ruby -e 'print Gem.user_dir')
export PATH=~/.bin:$PATH:$GEM_PATH/bin #:~/.node_modules/bin
