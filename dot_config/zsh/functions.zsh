#!/usr/bin/env zsh

# -----------------------------
# Andrew Heiss's zsh settings
# -----------------------------
#
# Useful functions
#
# Last updated 2024-03-05
# ------------------------------

# Open man page in Preview
pman(){
  man -t $* | ps2pdf - - | open -g -f -a /System/Applications/Preview.app
  #man -t "${1}" | open -f -a /Applications/Preview.app
}

# Open man page in Visual Studio Code
tman(){
  MANWIDTH=160 MANPAGER='col -bx' man $@ | code -
}

# Quit an application from the command line
quit(){
  for app in $*; do
    osascript -e 'quit app "'$app'"'
  done
}

# Relaunch an application
relaunch(){
  for app in $*; do
    osascript -e 'quit app "'$app'"';
    sleep 2;
    open -a $app
  done
}

# Delete an application with AppCleaner
uninstall(){
  open -a AppCleaner /Applications/"${1}".app
}

# mkdir, cd into it (Also `cd !$`)
mkcd(){
  mkdir -p "$*"
  cd "$*"
}

# Open a file with Marked
marked(){
  open -a "Marked 2.app" "${1}"
}

# cd to the path of the front Finder window
cdf() {
  target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
  if [ "$target" != "" ]; then
    cd "$target"; pwd
  else
    echo 'No Finder window found' >&2
  fi
}

# Make icns file from a single png
# via https://stackoverflow.com/a/44509460/120898
mkicns() {
    if [[ -z "$*" ]] || [[ "${*##*.}" != "png" ]]; then
        echo "Input file invalid"
    else
        filename="${1%.*}"
        mkdir "$filename".iconset
        for i in 16 32 128 256 ; do
            n=$(( i * 2 ))
            sips -z $i $i "$1" --out "$filename".iconset/icon_${i}x${i}.png
            sips -z $n $n "$1" --out "$filename".iconset/icon_${i}x${i}@2x.png
            [[ $n -eq 512 ]] && \
            sips -z $n $n "$1" --out "$filename".iconset/icon_${n}x${n}.png
            (( i++ ))
        done
        cp "$1" "$filename".iconset/icon_512x512@2x.png
        iconutil -c icns "$filename".iconset
        rm -r "$filename".iconset
    fi
}

thumbnail_pdf() {
    convert -thumbnail 700 -background white -alpha remove -units PixelsPerInch -density 300 "$1[0]" $2
}

thumbnail_slides() {
    # convert -thumbnail 1700 -background white -alpha remove -units PixelsPerInch -density 144 $1[0] $2
    convert -thumbnail 1700 -background white -alpha remove -units PixelsPerInch -density 300 "$1[0]" $2
}

# https://help.dropbox.com/files-folders/restore-delete/ignored-files
dropbox_ignore() {
    xattr -w com.dropbox.ignored 1 "$1"
}

dropbox_unignore() {
    xattr -d com.dropbox.ignored "$1"
}
