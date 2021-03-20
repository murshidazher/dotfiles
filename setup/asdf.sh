#!/usr/bin/env bash

# Setup asdf and install global versions
# Requires: asdf and asdf-nodejs
debug=${1:-false}

# List of components to install
PYTHON_PIPS=(httpie)

# Load help lib if not already loaded.
if [ -z ${libloaded+x} ]; then
  source ./lib.sh
fi

# Check if asdf is installed.
if hash asdf 2>/dev/null; then
  botintro "Setup asdf and global versions"

  # node
  action "asdf: setting up Node"

  asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
  bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'

  # install
  action "asdf: installing global versions"

  asdf install

  # java
  action "asdf: setting up Java"

  asdf plugin-add java
  local LATEST_JAVA_CORRETTO_VERSION=$(asdf list-all java | grep '^corretto-' | tail -1)

  # install
  action "asdf: installing global versions"

  asdf install java "${LATEST_JAVA_CORRETTO_VERSION}"
  asdf global java "${LATEST_JAVA_CORRETTO_VERSION}"

  # python
  asdf plugin-add python

  action "asdf: setting up Python"
  local LATEST_PYTHON2_VERSION=$(asdf list-all python | grep '^2\.' | grep -v '\-dev\|rc' | tail -1)
  local LATEST_PYTHON3_VERSION=$(asdf list-all python | grep '^3\.' | grep -v '\-dev\|rc' | grep -v 'b\d\+' | tail -1)

  # install
  action "asdf: installing global versions of python"
  asdf install python "${LATEST_PYTHON2_VERSION}"
  asdf install python "${LATEST_PYTHON3_VERSION}"
  asdf global python "${LATEST_PYTHON3_VERSION}" "${LATEST_PYTHON2_VERSION}"

  action "asdf: installing root packages"
  asdf shell python "${LATEST_PYTHON3_VERSION}"
  pip install -U pip
  pip install "${PYTHON_PIPS[@]}"

  # fin.
else
  echo "WARNING: asdf not found."
fi
