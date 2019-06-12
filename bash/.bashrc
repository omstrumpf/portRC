#### HOUSEKEEPING ####

# Maintain updated window size.
shopt -s checkwinsize

# enable bash completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion || {
    # if not found in /usr/local/etc, try the brew --prefix location
    [ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ] && \
        . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
}

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

#### VERSIONING ####

# python version
alias python='python2'
alias pip='pip2'

#### ALIASES ####

# ls
alias ll='ls -l'
alias la='ls -al'
alias cl='clear'

# git
alias g='git'
alias gl='git log --graph --decorate --oneline --all'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gd='git diff'
alias gb='git branch'
alias gf='git fetch -ap'
alias gca='git commit --amend --no-edit'
alias gpu='git push -u origin HEAD'

# todos
alias todos='grep -rIn "TODO" *'

#### PROMPT ####

# git branch ps1
GIT_PS1_SHOWDIRTYSTATE=true

# colors
GITCOLOR="33m" # Color for git branch

# Machine code (optional)
export MCHNCODE=""
export MCHNDELIM=""
export MCHNCOLOR="m"

source ~/.bashprompttag 1> /dev/null 2> /dev/null # read in machine-specific settings

export PS1="\[\e[$MCHNCOLOR\]$MCHNCODE\[\e[m\]$MCHNDELIM\w\[\e[$GITCOLOR\]\$(__git_ps1)\[\e[m\] \u$ "
