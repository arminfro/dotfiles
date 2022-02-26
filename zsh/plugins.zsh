# Spaceship Prompt config
GREEN="029"
ORANGE="166"
ORANGE_LIGHT="214"
GRAY="248"

export SPACESHIP_GIT_BRANCH_COLOR="$GREEN"
export SPACESHIP_DIR_COLOR="$ORANGE"
export SPACESHIP_DOCKER_COLOR="$ORANGE"
export SPACESHIP_DIR_COLOR="$ORANGE_LIGHT"
export SPACESHIP_GIT_STATUS_COLOR="$GRAY"
export SPACESHIP_PACKAGE_COLOR="161"

export SPACESHIP_VI_MODE_NORMAL="[]"
export SPACESHIP_VI_MODE_INSERT="[]"
#        

# zplug
source ~/.zplug/init.zsh

# zplug manages itself
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# ctrl-p, ctrl-n to cycle through history stack
# see more keybindings: https://github.com/jeffreytse/zsh-vi-mode#-usage
zplug "jeffreytse/zsh-vi-mode"
ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT


# NOTE: fzf-tab needs to be loaded after compinit, but before plugins which will wrap widgets, such as zsh-autosuggestions or fast-syntax-highlighting!!
zplug "Aloxaf/fzf-tab", defer:2, if:"[ -x $(which fzf) ]"

# aliases
zplug "plugins/common-aliases", from:oh-my-zsh
zplug "katrinleinweber/oh-my-zsh-youtube-dl-aliases", at:main, if:"[ -x $(which youtube-dl) ]"
zplug "akarzim/zsh-docker-aliases", if:"[ -x $(which docker) ]"
zplug "zpm-zsh/ls"
zplug "plugins/git", from:oh-my-zsh, if:"[ -x $(which git) ]"
zplug "plugins/archlinux", from:oh-my-zsh, if:"[ -x $(which pacman) ]"
zplug "plugins/systemd", from:oh-my-zsh #, if:"[ -x $(which systemctl)]" # somehow this evalutes to false ?
zplug "plugins/bundler", from:oh-my-zsh, if:"[ -x $(which bundler) ]"
# zplug "plugins/deno", from:oh-my-zsh, if:"[ -x $(which deno) ]"
zplug "plugins/firewalld", from:oh-my-zsh, if:"[ -x $(which firewall)-cmd]"
zplug "plugins/fd", from:oh-my-zsh, if:"[ -x $(which fd) ]"
zplug "plugins/isodate", from:oh-my-zsh
zplug "plugins/rsync", from:oh-my-zsh, if:"[ -x $(which rsync) ]"
zplug "plugins/vscode", from:oh-my-zsh, if:"[ -x $(which code) ]"
zplug "plugins/yum", from:oh-my-zsh, if:"[ -x $(which yum) ]"
zplug "plugins/dnf", from:oh-my-zsh, if:"[ -x $(which dnf) ]"

# completions
zplug "zsh-users/zsh-autosuggestions"
zplug "srijanshetty/zsh-pandoc-completion", if:"[ -x $(which pandoc) ]"
zplug "MenkeTechnologies/zsh-cargo-completion", if:"[ -x $(which cargo) ]"
zplug "zpm-zsh/ssh", if:"[ -x $(which ssh) ]" # completion for ssh hostnames
zplug "unixorn/rake-completion.zshplugin", if:"[ -x $(which rake) ]"
zplug "plugins/gem", from:oh-my-zsh, if:"[ -x $(which gem) ]"
zplug "plugins/ruby", from:oh-my-zsh, if:"[ -x $(which ruby) ]"
zplug "plugins/rails", from:oh-my-zsh, if:"[ -x $(which rails) ]"
zplug "plugins/docker", from:oh-my-zsh, if:"[ -x $(which docker) ]"
zplug "plugins/docker-compose", from:oh-my-zsh, if:"[ -x $(which docker-compose) ]"
zplug "plugins/rust", from:oh-my-zsh, if:"[ -x $(which rust) ]"
zplug "plugins/ripgrep", from:oh-my-zsh, if:"[ -x $(which rg) ]"
zplug "plugins/yarn", from:oh-my-zsh, if:"[ -x $(which yarn) ]"
zplug "plugins/npm", from:oh-my-zsh, , if:"[ -x $(which npm) ]"
zplug "plugins/ufw", from:oh-my-zsh, , if:"[ -x $(which ufw) ]"
# errors: git-fzf:19: command not found: _status
# zplug "alexiszamanidis/zsh-git-fzf", if:"[ -x $(which fzf) ]"

# utility
zplug "olets/zsh-window-title", at:main
zplug "zdharma-continuum/fast-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "chrissicool/zsh-256color"
zplug "MichaelAquilina/zsh-you-should-use"
zplug "hlissner/zsh-autopair"
zplug "zpm-zsh/colors"
zplug "plugins/zsh-colored-man-pages", from:oh-my-zsh
zplug "plugins/fancy-ctrl-z", from:oh-my-zsh
zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, as:theme
zplug "brymck/print-alias"
zplug "changyuheng/fz", defer:1, on:"skywind3000/z.lua"
FZ_HISTORY_CD_CMD=_zlua
# adds more vim motions to the built-in
zplug "zsh-vi-more/vi-motions"
# supports vim with line number command, e.g.: package.json:12
zplug "nviennot/zsh-vim-plugin" 
# runs ls and git status after chpwd, compatible with exa
zplug "binury/smart-cd"
# double tab escape to prefix command with sudo
zplug "plugins/sudo", from:oh-my-zsh
# preventing any code from actually running while pasting
zplug "plugins/safe-paste", from:oh-my-zsh
# rm commands deletes into trash directory
zplug "mattmc3/zsh-safe-rm"
# filter commands for sensitive information before storing in history
zplug "jgogstad/passwordless-history"
# tracks metadata to zsh history
# integration with zsh-autosuggestions not working as I wish, that's why HISTFILE is still defined
zplug "larkery/zsh-histdb"

# commands
zplug "skywind3000/z.lua"
zplug "arzzen/calc.plugin.zsh"
zplug "LucasLarson/gunstage", as:command, use:"bin/git-unstage", rename-to:gunstage, at:main, if:"[ -x $(which git) ]"
zplug "plugins/genpass", from:oh-my-zsh
zplug "plugins/urltools", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
# generate .gitignore with templates from gitignore.io offline
zplug "plugins/gitignore", from:oh-my-zsh, if:"[ -x $(which git) ]"

# # ctrl-o to copy current command before <CR>
# zplug "plugins/copybuffer", from:oh-my-zsh
# zplug "zdharma-continuum/history-search-multi-word"
# zplug "plugins/web-search", from:oh-my-zsh
# zplug "knu/zsh-manydots-magic", lazy:false
# zplug "plugins/copyfile", from:oh-my-zsh #, as:command, use:"copyfile.plugin.zsh", rename-to:copyfile

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
    zplug install;
fi

# source plugins and add commands to $PATH
zplug load
