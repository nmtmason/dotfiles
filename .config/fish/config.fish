# Environment
set fish_greeting ""

# Directory listing colors
if test -f {$HOME}/.dircolors
  eval (dircolors -c {$HOME}/.dircolors)
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

# Prompt
function fish_prompt
  set_color $fish_color_cwd
  echo -n (basename $PWD)
  set_color normal
  echo -n ' ) '
end

