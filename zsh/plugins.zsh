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

# load zgenom
source "${HOME}/.zgenom/zgenom.zsh"

if_exist() {
    if hash $1 &>/dev/null; then
        return 0 # true
    else
        return 1 # false
    fi
}

compinit

# if the init script doesn't exist
if ! zgenom saved; then
  echo "Creating a zgenom save"

  # see more keybindings: https://github.com/jeffreytse/zsh-vi-mode#-usage
  zgenom load jeffreytse/zsh-vi-mode

  # aliases
  zgenom ohmyzsh plugins/common-aliases
  zgenom ohmyzsh plugins/copyfile
  zgenom ohmyzsh plugins/copypath
  zgenom ohmyzsh plugins/isodate
  zgenom load zpm-zsh/ls
  if_exist systemctl && zgenom ohmyzsh plugins/systemd
  if_exist bundler && zgenom ohmyzsh plugins/bundler
  if_exist deno && zgenom ohmyzsh zplug plugins/deno
  if_exist firewall-cmd && zgenom ohmyzsh plugins/firewalld
  if_exist fd && zgenom ohmyzsh plugins/fd
  if_exist rsync && zgenom ohmyzsh plugins/rsync
  if_exist code && zgenom ohmyzsh plugins/vscode
  if_exist yum && zgenom ohmyzsh plugins/yum
  if_exist dnf && zgenom ohmyzsh plugins/dnf
  if_exist git && zgenom ohmyzsh plugins/git
  if_exist pacman && zgenom ohmyzsh plugins/archlinux
  if_exist youtube-dl && zgenom load katrinleinweber/oh-my-zsh-youtube-dl-aliases
  if_exist docker && zgenom load akarzim/zsh-docker-aliases

  # completions
  zgenom load zsh-users/zsh-autosuggestions
  if_exist pandoc && zgenom load srijanshetty/zsh-pandoc-completion
  # if_exist rustc && zgenom ohmyzsh plugins/rustup
  # if_exist cargo && zgenom ohmyzsh plugins/cargo
  # if_exist cargo && zgenom load MenkeTechnologies/zsh-cargo-completion
  # if_exist rustc && zgenom ohmyzsh plugins/rust
  if_exist ssh && zgenom load zpm-zsh/ssh
  if_exist rake && zgenom load unixorn/rake-completion.zshplugin
  if_exist gem && zgenom ohmyzsh plugins/gem
  if_exist ruby && genome ohmyzsh plugins/ruby
  # if_exist rails && zgenom ohmyzsh plugins/rails
  if_exist docker && zgenom ohmyzsh plugins/docker
  if_exist docker-compose && zgenom ohmyzsh plugins/docker-compose
  if_exist rg && zgenom ohmyzsh plugins/ripgrep
  if_exist yarn && zgenom ohmyzsh plugins/yarn
  if_exist npm && zgenom ohmyzsh plugins/npm
  if_exist ufw && zgenom ohmyzsh plugins/ufw
  # errors: git-fzf:19: command not found: _status
  # zplug "alexiszamanidis/zsh-git-fzf", if:"[ -x $(which fzf 2> /dev/null) ]"

  # utility
  zgenom load spaceship-prompt/spaceship-prompt
  #  automatically sources (known/whitelisted)
  zgenom load Tarrasch/zsh-autoenv; AUTOENV_FILE_ENTER=.env
  zgenom load Aloxaf/fzf-tab # todo, does not seem to work: if_exist fzf && ...
  # zgenom ohmyzsh plugins/fancy-ctrl-z
  # double tab escape to prefix command with sudo
  zgenom ohmyzsh plugins/sudo
  # preventing any code from actually running while pasting
  zgenom ohmyzsh plugins/safe-paste
  # new shells will have PWD set to last openend
  zgenom load andreaconti/auto-cd
  zgenom load olets/zsh-window-title
  zgenom load zdharma-continuum/fast-syntax-highlighting
  zgenom load zsh-users/zsh-history-substring-search
  zgenom load chrissicool/zsh-256color
  zgenom load MichaelAquilina/zsh-you-should-use
  zgenom load hlissner/zsh-autopair
  zgenom load zpm-zsh/colors
  zgenom load brymck/print-alias
  # zgenom load marzocchi/zsh-notify todo, failed to load
  # adds more vim motions to the built-in
  zgenom load zsh-vi-more/vi-motions
  # supports vim with line number command, e.g.: package.json:12
  zgenom load nviennot/zsh-vim-plugin
  # runs ls and git status after chpwd, compatible with exa
  zgenom load binury/smart-cd
  # rm commands deletes into trash directory
  zgenom load mattmc3/zsh-safe-rm
  # filter commands for sensitive information before storing in history
  zgenom load jgogstad/passwordless-history
  # tracks metadata to zsh history
  # integration with zsh-autosuggestions not working as I wish, that's why HISTFILE is still defined
  zgenom load larkery/zsh-histdb
  # jira wrapper
  zgenom load unixorn/jira-commands

  # commands
  zgenom load knu/zsh-manydots-magic; autoload -Uz manydots-magic; manydots-magic; setopt autocd
  zgenom load skywind3000/z.lua
  # fuzzy search to tab completion of z
  zgenom load changyuheng/fz; FZ_HISTORY_CD_CMD=_zlua
  zgenom load arzzen/calc.plugin.zsh
  if_exist git && zgenom load LucasLarson/gunstage # git unstage command
  zgenom ohmyzsh plugins/genpass
  zgenom ohmyzsh plugins/urltools
  zgenom ohmyzsh plugins/extract
  # generate .gitignore with templates from gitignore.io offline
  if_exist git && zgenom ohmyzsh plugins/gitignore

  # # ctrl-o to copy current command before <CR>
  # zplug "plugins/copybuffer", from:oh-my-zsh
  # zplug "zdharma-continuum/history-search-multi-word"
  # zplug "plugins/web-search", from:oh-my-zsh
  # zplug "plugins/copyfile", from:oh-my-zsh #, as:command, use:"copyfile.plugin.zsh", rename-to:copyfile

  # generate the init script from plugins above
  zgenom save
fi

ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT

# https://github.com/skywind3000/z.lua#options
_ZL_MATCH_MODE=1

# # load aliases
# typeset -U config_files
# config_files=($DOTFILES/**/*.zsh)
# for file in ${(M)config_files:#*/aliases.zsh}; do
#   source $file
# done
# unset config_files
