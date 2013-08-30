# Environment
set -o vi
export PAGER=less
export EDITOR=vim
export TERM="screen-256color"
export PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Application specific
export PATH="$(cd $(which heroku)/..; pwd):$PATH"
export PATH="$(cd $(which ruby)/..; pwd):$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"
source /usr/local/etc/profile.d/z.sh

# History
export HISTCONTROL=ignoredups:ignorespace
export HISTIGNORE="&:ls:la:pwd:fg:bg:history:exit:clear"
export HISTSIZE=4096
export HISTTIMEFORMAT="%d/%m/%Y %H:%M:%S ";
unset HISTFILESIZE
shopt -s cmdhist
shopt -s histappend

# Aliases
case $(uname -s) in
  Darwin)
    alias ls="ls -lhFG"
  ;;
  Linux)
    alias ls="ls --color=always -hlF"
  ;;
esac
alias l='ls'
alias la='ls -a'
alias grep='grep --color=auto'
alias vi='vim'
alias psg='ps -ef | grep'
alias df='df -h'
alias du='du -h'
alias session='tmux new-session -s'
alias attach='tmux attach-session -t'

# Functions
function mcd() {
  mkdir "$1" && cd "$1"
}

function upsearch() {
  slashes="${PWD//[^\/]/}"
  directory="$PWD"
  for (( n=${#slashes}; n>0; --n ))
  do
    test -e "$directory/$1" && echo "$directory/$1" && return
    directory="$directory/.."
  done
}

extract() {
  if [ -f "$1" ] ; then
    case "$1" in
      *.tar.bz2) tar xvjf "$1" ;;
      *.tar.gz) tar xvzf "$1" ;;
      *.bz2) bunzip2 "$1" ;;
      *.rar) unrar x "$1" ;;
      *.gz) gunzip "$1" ;;
      *.tar) tar xvf "$1" ;;
      *.tbz2) tar xvjf "$1" ;;
      *.tgz) tar xvzf "$1" ;;
      *.zip) unzip "$1" ;;
      *.Z) uncompress "$1" ;;
      *.7z) 7z x "$1" ;;
      *)
    echo "$1 is not a valid archive"
    return 1
    ;;
    esac
  else
    echo "$1 is not a valid file"
    return 1
  fi
  return 0
}

# Prompt
function fg_color { tput setaf "$1"; }
function bg_color { tput setab "$1"; }
function reset_color { tput sgr0 "$1"; }

function _vcs_info {
  local prompt
  if [ $(upsearch ".git") ]; then
    prompt="$prompt $(reset_color)$(_git_prefix)$(reset_color)"
    prompt="$prompt $(bg_color 0)$(fg_color 7)$(_git_symbol)$(reset_color)"
    prompt="$prompt $(bg_color 0)$(fg_color 7)$(_git_branch)$(reset_color)"
    prompt="$prompt $(bg_color 1)$(fg_color 7)$(_git_status)$(reset_color)"
  fi
  echo $prompt
}
function _git_prefix {
  echo "on"
}
function _git_symbol {
  echo "±"
}
function _git_branch {
  local ref
  ref=$(git symbolic-ref HEAD 2> /dev/null) ||
    ref=$(git rev-parse --short HEAD 2> /dev/null) ||
    return
  ref=${ref#refs/heads/}
  echo "$ref"
}
function _git_status {
  local status
  status=$(git status -s 2> /dev/null)
  if [ -z "$status" ]; then
    return
  fi
  echo "!"
}

export PS1="\$(bg_color 0)\$(fg_color 7)\w\$(reset_color) \$(_vcs_info)
% "

