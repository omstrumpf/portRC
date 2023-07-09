function addpath {
  PATH="$PATH:$1"
}

PATH="$HOME/bin"
addpath "./node_modules/.bin"
addpath "/usr/local/bin"
addpath "/usr/local/sbin"
addpath "/usr/bin"
addpath "/usr/sbin"
addpath "/bin"
addpath "/sbin"

export PATH
