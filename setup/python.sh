# List of components to install
PYTHON_PIPS=(httpie)

main() {
  install_or_update_python
  cleanup
}

install_or_update_python() {
  # Ensure asdf is loaded
  if [ -z "$(asdf plugin-list | grep 'python')" ]; then
    asdf plugin-add python
  fi

  echo "Installing the latest version of Python"
  local LATEST_PYTHON2_VERSION=$(asdf list-all python | grep '^2\.' | grep -v '\-dev\|rc' | tail -1)
  local LATEST_PYTHON3_VERSION=$(asdf list-all python | grep '^3\.' | grep -v '\-dev\|rc' | grep -v 'b\d\+' | tail -1)
  asdf install python "${LATEST_PYTHON2_VERSION}"
  asdf install python "${LATEST_PYTHON3_VERSION}"
  asdf global python "${LATEST_PYTHON3_VERSION}" "${LATEST_PYTHON2_VERSION}"

  echo "Installing the root python packages"
  asdf shell python "${LATEST_PYTHON3_VERSION}"
  pip install -U pip
  pip install "${PYTHON_PIPS[@]}"

  echo "Install MiniConda"
  MINICONDA_PATH="$HOME/.miniconda"
  if [ -d "$DEV_DIR" ]; then
    MINICONDA_PATH="$DEV_DIR/miniconda"
  fi
  if [ ! -d "$MINICONDA_PATH" ]; then
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
    chmod +x ./Miniconda3-latest-MacOSX-x86_64.sh
    ./Miniconda3-latest-MacOSX-x86_64.sh -b -p "$MINICONDA_PATH"
    rm ./Miniconda3-latest-MacOSX-x86_64.sh
  fi

  # now we activate miniconda
  export PATH="$MINICONDA_PATH/bin:$PATH"

  # and install the default deps
  conda install numpy scipy matplotlib pip -y
}

cleanup() {
  echo 'Cleanup Homebrew Cache...'
  brew cleanup -s
  rm -rfv /Library/Caches/Homebrew/*
  brew tap --repair
  echo 'Cleanup gems...'
  gem cleanup
  echo 'Re-generating asdf shims...'
  asdf reshim
}

main
