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
export SPACESHIP_VI_MODE_INSERT="[]"
#        

# Zinit Plugins
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node \
    zdharma/fast-syntax-highlighting \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-completions \
    zsh-users/zsh-history-substring-search \
    chrissicool/zsh-256color \
    MichaelAquilina/zsh-you-should-use \
    hlissner/zsh-autopair \
    Tarrasch/zsh-bd \
    arzzen/calc.plugin.zsh \
    zpm-zsh/colors \
    zpm-zsh/colorize \
    zpm-zsh/ls \
    zpm-zsh/material-colors \
    ael-code/zsh-colored-man-pages \
    leophys/zsh-plugin-fzf-finder \
    zdharma/history-search-multi-word \
    brymck/print-alias \
    yous/vanilli.sh \
    zsh-vi-more/vi-motions \
    nviennot/zsh-vim-plugin \
    denysdovhan/spaceship-prompt \
    lukechilds/zsh-better-npm-completion \
    zsh-users/zsh-completions \
    greymd/docker-zsh-completion \
    srijanshetty/zsh-pandoc-completion \
    unixorn/rake-completion.zshplugin \
    zpm-zsh/ssh \
    g-plane/zsh-yarn-autocompletions \
    trystan2k/zsh-tab-title \
    knu/zsh-manydots-magic \
    binury/smart-cd \

# Marks Dirs, by calling 'mark', Ctrl-g
if command -v fzf > /dev/null 2>&1; then
  zinit light urbainvaes/fzf-marks
fi

# zinit light yonchu/vimman
# zstyle ':vimman:' dir ~/.vim/bundle ~/hoge

# zinit light MichaelAquilina/zsh-auto-notify
# export AUTO_NOTIFY_EXPIRE_TIME=2000

zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZ::plugins/archlinux/archlinux.plugin.zsh
zinit snippet OMZ::plugins/systemd/systemd.plugin.zsh
zinit snippet OMZ::plugins/common-aliases/common-aliases.plugin.zsh
zinit snippet OMZ::plugins/vi-mode/vi-mode.plugin.zsh
