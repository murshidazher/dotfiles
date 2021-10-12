#!/usr/bin/env bash
debug=${1:-false}

# Load help lib if not already loaded.
if [ -z ${libloaded+x} ]; then
  source ./lib.sh
fi

action "asdf: setting up Elixir"

action "asdf: Setting up asdf plugins for java, erlang and elixir"
asdf plugin-add java https://github.com/halcyon/asdf-java.git >/dev/null 2>&1
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git >/dev/null 2>&1
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git >/dev/null 2>&1

# Set the containing directory for later use
versions_dir="${HOME}/.dotfiles/installer/versions"

# Read given file line by line
function read_file {
  versions_dir=${1}
  local file_path="${versions_dir}"
  while read -r line; do
    action "${line}"
  done <"${file_path}"
}

function install_versions {
  local language="${1}"
  local versions_list=$(read_file "${versions_dir}/${language}")
  for version in ${versions_list}; do
    running "Installing ${version} for ${language}"
    asdf install $language ${version} >/dev/null 2>&1
    local status=$?
    if [ ${status} -ne "0" ]; then
      error "Last exit code was ${status} for 'asdf install ${language} ${version}'. Please run manually. Aborting."
      exit 1
    fi
  done
  set_global ${language} ${version}
}

function set_global {
  local language=${1}
  local latest_version=${2}
  running "\t\tSetting ${language} ${latest_version} as global"
  asdf global ${language} ${latest_version} >/dev/null 2>&1
}

action "\tInstalling versions"

install_versions "java"
source ~/.asdf/plugins/java/set-java-home.bash
grep -q "source ~/.asdf/plugins/java/set-java-home.bash" ~/.zshrc || echo "source ~/.asdf/plugins/java/set-java-home.bash" >>~/.zshrc

install_versions "erlang"
install_versions "elixir"
