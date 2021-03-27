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
  # adoptium openjdk 8 with JVM hotspot [difference between compilers](shorturl.at/fizN9)
  local LATEST_JAVA8_LTS_VERSION=$(asdf list-all java | grep '^adoptopenjdk-8.0.' | grep -v '\.openj9\|rc' | tail -1)
  # if you need a specific vendor latest version
  local LATEST_JAVA_CORRETTO_VERSION=$(asdf list-all java | grep '^corretto-' | tail -1)

  # install
  action "asdf: installing global versions $LATEST_JAVA8_LTS_VERSION"

  asdf install java "${LATEST_JAVA8_LTS_VERSION}"
  asdf global java "${LATEST_JAVA8_LTS_VERSION}"

  # maven
  action "asdf: setting up Maven"
  asdf plugin-add maven

  local LATEST_MAVEN_VERSION=$(asdf list-all maven | grep '^3\.' | grep -v '\-dev\|rc' | grep -v 'b\d\+' | tail -1)

  # install
  action "asdf: installing global versions of maven $LATEST_MAVEN_VERSION"
  asdf install maven "${LATEST_MAVEN_VERSION}"
  asdf global maven "${LATEST_MAVEN_VERSION}"

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
