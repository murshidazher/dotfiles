#!/usr/bin/env bash
debug=${1:-false}

# Load help lib if not already loaded.
if [ -z ${libloaded+x} ]; then
  source ./lib.sh
fi

# install miniconda
action "Install: miniconda"

MINICONDA_PATH="$HOME/.miniconda"

if [ -d "$DEV_DIR" ]; then
  MINICONDA_PATH="$DEV_DIR/miniconda"
fi

# fetch the latest installer for miniconda
if [ ! -d "$MINICONDA_PATH" ]; then
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
  chmod +x ./Miniconda3-latest-MacOSX-x86_64.sh
  ./Miniconda3-latest-MacOSX-x86_64.sh -b -p "$MINICONDA_PATH"
  rm ./Miniconda3-latest-MacOSX-x86_64.sh
fi

# now we activate miniconda
export PATH="$MINICONDA_PATH/bin:$PATH"

action "Install: miniconda basic utitlity packages"

# and install the default deps
conda install numpy scipy matplotlib pip -y

# fin.
