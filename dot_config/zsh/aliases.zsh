#!/usr/bin/env zsh

# -----------------------------
# Andrew Heiss's zsh settings
# -----------------------------
#
# Aliases
#
# Last updated 2024-03-05
# -----------------------------

# --------------------
# Core sh commands
# --------------------
# Make sudo work with aliases
# alias sudo="sudo "  # bash way
# alias -g ls='ls'  # zsh way - make it a global alias


# Colored ls output is built in! No reason to replace it with GNU's coreutils
# alias ls='ls -GF'
# alias lsa='ls -lA'

# See man ls for an explanation of these color settings
export LSCOLORS=exfxcxdxbxegedabagacad

alias cm="chezmoi"

# Use eza! https://eza.rocks/
alias eza='eza --time-style=long-iso'
alias ls='eza'
alias lt='eza --tree --level=2'

# Use bat! https://github.com/sharkdp/bat
alias cat='bat --paging=never'

alias cls='clear'
alias ccls='cd && clear'
alias less='less -r'

# Nifty things from Brett Terpstra
alias cpu='top -o cpu'
alias mem='top -o rsize'
# alias src="source ~/.bash_profile"


# ----------------------------
# macOS and network commands
# ----------------------------
# Flush DNS
alias flush="sudo dscacheutil -flushcache"

# Get your current public IP
alias ip="curl icanhazip.com"

# Quick way to rebuild the Launch Services database and get rid
# of duplicates in the Open With submenu.
# See http://furbo.org/2013/04/22/launch-services-woes/
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user ; killall Dock'

# Clear icon cache (via http://furbo.org/2015/01/19/clearing-the-icon-services-cache-in-yosemite/)
# https://apple.stackexchange.com/questions/225024/reset-icon-cache-on-macbook
# sudo find /private/var/folders/ -name com.apple.dock.iconcache -exec rm {} \;
# sudo find /private/var/folders/ -name com.apple.iconservices -exec rm -rf {} \;
# sudo rm -rf /Library/Caches/com.apple.iconservices.store
# Restart


# -----------------
# Other shortcuts
# -----------------
# alias fbctl='flashbakectl'
# alias webshot='python ~/bin/webkit2png'
# alias ql='qlmanage -p 2>/dev/null'

# Toggle ring light
alias ring_light="Rscript ~/Dropbox/bin/toggle_ring_light.R"

# Mount protected dissertation data
alias diss-protect="hdiutil attach ~/Research/••Dissertation/Protected/Protected.sparsebundle -stdinpass"

# Syntax highlight R code in clipboard and put in clipboard as RTF
alias prettify_r="pbpaste | highlight --out-format=rtf --syntax=r --style=zenburn | pbcopy"
alias monokai_r="pbpaste | pygmentize -f rtf -O style=monokai -l r | pbcopy"

# Use radian instead of R (https://github.com/randy3k/radian)
# alias r="radian"

alias get_seed='curl "https://www.random.org/integers/?num=1&min=100000&max=999999&col=1&base=10&format=plain&rnd=new"'
