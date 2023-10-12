fpath=($DOTFILES/functions $fpath)

autoload -U $DOTFILES/functions/*(:t)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

AUTOENV_FILE_ENTER=.env

# General Options
setopt noflowcontrol          # Prevent freezing when pressing Ctrl+S/Ctrl+Q
setopt prompt_subst           # Allow expansion in prompts
setopt append_history         # Append history instead of overwriting it
setopt extended_history       # Save command timestamps and durations in history
setopt longlistjobs           # Display PID when suspending processes
setopt nonomatch              # Avoid 'zsh: no matches found...' error
setopt notify                 # Report background job status immediately
setopt hash_list_all          # Hash the entire command path before completion
setopt completeinword         # Perform completion inside words
setopt noshwordsplit          # Use zsh-style word splitting
setopt interactivecomments    # Allow comments in interactive code

# Background Task Options
setopt NO_BG_NICE             # Don't lower priority of background tasks
setopt NO_HUP                 # Don't send SIGHUP to background tasks
setopt NO_LIST_BEEP           # Disable beep when listing tasks
setopt LOCAL_OPTIONS          # Allow functions to have local options
setopt LOCAL_TRAPS            # Allow functions to have local traps

# History Options
setopt HIST_VERIFY            # Verify commands before execution
setopt SHARE_HISTORY          # Share history between sessions
setopt INC_APPEND_HISTORY     # Add history incrementally and share across sessions
setopt HIST_IGNORE_ALL_DUPS   # Don't record duplicate commands in history
setopt HIST_REDUCE_BLANKS     # Reduce multiple consecutive blanks in history

# Completion Options
setopt PROMPT_SUBST           # Enable prompt substitution
setopt CORRECT                # Enable command correction
setopt COMPLETE_IN_WORD       # Perform completion inside words
setopt IGNORE_EOF             # Ignore EOF (Ctrl+D) during interactive input

# Alias Options
setopt complete_aliases       # Don't expand aliases before completion


# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"      beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"       end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"    overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}" backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"    delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"        up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"      down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"      backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"     forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"    beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"  end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}" reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# https://github.com/larkery/zsh-histdb#integration-with-zsh-autosuggestions
_zsh_autosuggest_strategy_histdb_top_here() {
    local query="select commands.argv from
history left join commands on history.command_id = commands.rowid
left join places on history.place_id = places.rowid
where places.dir LIKE '$(sql_escape $PWD)%'
and commands.argv LIKE '$(sql_escape $1)%'
group by commands.argv order by count(*) desc limit 1"
    suggestion=$(_histdb_query "$query")
}

ZSH_AUTOSUGGEST_STRATEGY=histdb_top_here

# source histdb-interactive.zsh
# bindkey '^r' _histdb-isearch


# bindkey '^[^[[D' backward-word
# bindkey '^[^[[C' forward-word
# bindkey '\e[1~' beginning-of-line
# bindkey '\e[4~' end-of-line
# bindkey '^[[3~' delete-char
# bindkey '^?' backward-delete-char

# colors for fzf
if [[ -a ~/.fzf-base16.sh ]]; then
  source ~/.fzf-base16.sh
fi

# colors for shell
if [[ -a ~/.shell-base16.sh ]]; then
  source ~/.shell-base16.sh
fi

# Set keybindings for zsh-vi-mode insert mode
function zvm_after_init() {
    zvm_bindkey viins "^P" up-line-or-beginning-search
    zvm_bindkey viins "^N" down-line-or-beginning-search
    for o in files branches tags remotes hashes stashes each_ref; do
        eval "zvm_bindkey viins '^g^${o[1]}' fzf-git-$o-widget"
        eval "zvm_bindkey viins '^g${o[1]}' fzf-git-$o-widget"
    done
}
# Set keybindings for zsh-vi-mode normal and visual modes
function zvm_after_lazy_keybindings() {
    for o in files branches tags remotes hashes stashes each_ref; do
        eval "zvm_bindkey vicmd '^g^${o[1]}' fzf-git-$o-widget"
        eval "zvm_bindkey vicmd '^g${o[1]}' fzf-git-$o-widget"
        eval "zvm_bindkey visual '^g^${o[1]}' fzf-git-$o-widget"
        eval "zvm_bindkey visual '^g${o[1]}' fzf-git-$o-widget"
    done
}
