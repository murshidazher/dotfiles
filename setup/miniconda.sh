main() {
  install_or_update_python
  # cleanup
}

install_or_update_python() {
  # Ensure asdf is loaded

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
