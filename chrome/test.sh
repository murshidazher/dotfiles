#!/usr/bin/env bash

# Set defaultdotfilesdir var if not declared.
if [ -z ${defaultdotfilesdir+x} ]; then
  defaultdotfilesdir="$HOME/dotfiles"
fi

install_y() {
  echo "$1"
  echo "end"
}

# Install chrome extensions
# cat $defaultdotfilesdir/chrome/test-extensions.list | xargs -I {} ./install-chrome.sh {}
cat $defaultdotfilesdir/chrome/test-extensions.list | xargs -I {} install_y {}
