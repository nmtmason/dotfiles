# Environment
set fish_greeting ""

# Directory listing colors
if test -f ~/.dircolors
  eval (dircolors -c ~/.dircolors)
end

# Aliases
function ls
  command ls --color=auto -hlF $argv
end

function la
  ls -a $argv
end

function grep
  command grep --color=auto $argv
end

function vi
  vim $argv
end

