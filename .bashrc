# If not running interactively, don't do anything
[ -z "$PS1" ] && return
shopt -s checkwinsize

# Include the current directory in **/* glob expansions
shopt -s globstar

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

export LANGUAGE=en_GB.UTF-8
export LANG=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8

########################
# source configurations

for i in ~/.bashrc_*; do
  if [ -f "$i" ] ; then
    source $i;
  fi
done

# dotfiles: https://gitlab.com/joeyates/jgy-dotfiles
