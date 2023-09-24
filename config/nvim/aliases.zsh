alias nvim='SHELL=/bin/sh nvim'
alias vim='SHELL=/bin/sh nvim'
alias v='SHELL=/bin/sh nvim'

alias vim-logs='vim ~/.cache/nvim/*.log'

alias vim-update-plugins="nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'"
alias v-update-plugins="vim-update-plugins"
