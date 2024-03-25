#!/usr/bin/env zsh

# -----------------------------
# Andrew Heiss's zsh settings
# -----------------------------
#
# Path settings for personal laptop
#
# Last updated 2024-03-05
# ------------------------------

# export PATH="/usr/local/opt/python/libexec/bin:/Users/andrew/bin:/Users/andrew/Library/Python/3.7/bin:$PATH"
# export PATH="/usr/local/opt/python/libexec/bin:/usr/local/sbin:$HOME/bin:$DROPBOX/bin:$PATH"

# Add Visual Studio Code (code)
# export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Append/prepend things to the path with zsh: 
# https://stackoverflow.com/a/18077919/120898
eval "$(/opt/homebrew/bin/brew shellenv)"

# path=('/usr/local/bin' '/usr/local/sbin' '/usr/local/opt/python/libexec/bin' $HOME/bin $path)
path=('/opt/homebrew/bin' '/usr/local/bin' '/usr/local/sbin' $HOME/bin $path)
path+=('/Applications/Visual Studio Code.app/Contents/Resources/app/bin')
path+=($HOME/.cargo/bin)
export PATH

export BAT_CONFIG_PATH="$HOME/.config/bat/bat.conf"

export LIBGS=/usr/local/share/ghostscript/9.53.3/lib/libgs.dylib.9.53

export JAVA_HOME=$(/usr/libexec/java_home)

# Add homebrewed LLVM for clang, etc.
# export PATH="/usr/local/opt/llvm/bin:$PATH"

# Language-specific paths
# Java
# export JAVA_HOME="$(/usr/libexec/java_home)"

# Ruby
# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# source /Users/andrew/.rvm/scripts/rvm

# TeX
# export TEXINPUTS=.:$HOME/Library/texmf/tex/latex/phd_master
