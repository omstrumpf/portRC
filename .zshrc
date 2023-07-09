# prompt

fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure

# completion
# TODO

# history

HISTFILE="$HOME/.zsh_history"
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt share_history          # share command history data

export PAGER=less
export LESS='-R -S'
