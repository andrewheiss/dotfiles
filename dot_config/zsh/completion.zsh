#!/usr/bin/env zsh

# -----------------------------
# Andrew Heiss's zsh settings
# -----------------------------
#
# Autocompletion stuff
#
# Last updated 2024-03-05
# ------------------------------

# brew install zsh-completion
# See https://docs.brew.sh/Shell-Completion
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# Partial completion
zstyle ':completion:*' completer _complete _ignored

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]} r:|[._-]=** r:|=**'

# Initialize completion
autoload -Uz compinit
compinit
