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

# Zinit Plugins
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# needs to go early, cause of keybindings
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

# up here to be able to overwrite some by following plugins
zinit snippet OMZ::plugins/common-aliases/common-aliases.plugin.zsh

zinit ice wait"1" lucid
zinit light Aloxaf/fzf-tab

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
    arzzen/calc.plugin.zsh \
    zpm-zsh/colors \
    ael-code/zsh-colored-man-pages \
    zdharma/history-search-multi-word \
    brymck/print-alias \
    zsh-vi-more/vi-motions \
    nviennot/zsh-vim-plugin \
    denysdovhan/spaceship-prompt \
    zsh-users/zsh-completions \
    greymd/docker-zsh-completion \
    srijanshetty/zsh-pandoc-completion \
    unixorn/rake-completion.zshplugin \
    binury/smart-cd \
    akarzim/zsh-docker-aliases \
    katrinleinweber/oh-my-zsh-youtube-dl-aliases \
    hcgraf/zsh-sudo \
    mattmc3/zsh-safe-rm \
    jgogstad/passwordless-history \
    LucasLarson/gunstage \
    laggardkernel/git-ignore \
    knu/zsh-manydots-magic \
    zpm-zsh/ls \

# Marks Dirs, by calling 'mark', Ctrl-g
if command -v fzf > /dev/null 2>&1; then
  zinit light urbainvaes/fzf-marks
fi

zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZ::plugins/archlinux/archlinux.plugin.zsh
zinit snippet OMZ::plugins/systemd/systemd.plugin.zsh
zinit snippet OMZ::plugins/vi-mode/vi-mode.plugin.zsh
