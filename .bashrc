# Environment
set -o vi
export PAGER=less
export EDITOR=vim
export PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
shopt -s checkwinsize

# Directory listing colors
if [ -e "$HOME/.dircolors" ]; then
  eval $(dircolors -b "$HOME/.dircolors")
fi

# History
export HISTCONTROL=ignoredups:ignorespace
export HISTIGNORE="&:ls:la:pwd:fg:bg:history:exit:clear"
export HISTSIZE=4096
export HISTTIMEFORMAT="%d/%m/%Y %H:%M:%S ";
unset HISTFILESIZE
shopt -s cmdhist
shopt -s histappend

# Aliases
alias ls='ls --color=auto -hlF'
alias la='ls -a'
alias grep='grep --color=auto'
alias vi='vim'

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

function extract() {
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
export PS1="\$(fg_color 2)\W\$(reset_color)) "
