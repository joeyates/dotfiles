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
# source computer-specific configurations

for i in ~/.bashrc_*; do
  if [ -f "$i" ] ; then
    source $i;
  fi
done

# Heroku

export PATH=/usr/local/heroku/bin:$PATH

# NVM

export NVM_DIR="/home/joe/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

export PATH=$NVM_BIN:$PATH

# pass

export PASSWORD_STORE_ENABLE_EXTENSIONS=true

# rbenv

if test -f "$HOME/.rbenv/bin/rbenv" ; then
  PATH=$PATH:$HOME/.rbenv/bin # Add rbenv to PATH
  eval "$(rbenv init -)"
fi

# yarn

export PATH=$PATH:/home/joe/.config/yarn/global/node_modules/.bin

# Add my scripts to PATH
export PATH=~/bin:$PATH

# Ease access to project scripts
export PATH=./bin:./node_modules/.bin:$PATH
# In Bundler-managed Ruby projects, give predence to bundler shimmed scripts
export PATH=./bin/stubs:$PATH

export ANDROID_HOME=/home/joe/Android/Sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# Dedupe PATH...
# 1. split into lines at ':'
# 2. skip duplicates
# 3. join back into a single line with ':' separators
# 4. chop off the extra ':' from the end
#                    1                      2               3             4
export PATH=`tr ':' '\n' <<< $PATH | awk '!a[$0]++' | tr '\n' ':' | sed 's/.$//'`

# dotfiles: https://gitlab.com/joeyates/jgy-dotfiles
