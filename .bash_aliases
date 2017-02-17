# functions
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

# aliases
alias ls='ls --color=auto -hlF'
alias vi='vim'
