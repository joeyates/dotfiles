# If not running interactively, don't do anything
[ -z "$PS1" ] && return

########################
# source configurations

for i in ~/.bashrc_*; do
  if [ -f "$i" ] ; then
    source $i;
  fi
done

# dotfiles: https://gitlab.com/joeyates/jgy-dotfiles
