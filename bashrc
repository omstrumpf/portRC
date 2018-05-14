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

# git
alias g='git'
alias gl='git log --graph --decorate --oneline --all'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gb='git branch'

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
