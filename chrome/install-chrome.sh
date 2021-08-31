#!/usr/bin/env bash

CHROME_EXTENSIONS=(
  "bnjjngeaknajbdcgpfkgnonkmififhfo" # Fake filler
)

# install_chrome_extensions() {
#   info "installing Chrome extensions"

#   local extension_dir=~/Library/Application\ Support/Google/Chrome/External\ Extensions/
#   if [ ! -d "$extension_dir" ]; then
#     mkdir "$extension_dir"
#   fi

#   for extension in "${CHROME_EXTENSIONS[@]}"; do
#     cp ./extension.json "${extension_dir}${extension}.json"
#   done

#   success "installed Chrome extensions"
# }

install_chrome_extension() {
  preferences_dir_path="$HOME/Library/Application Support/Google/Chrome/External Extensions"
  pref_file_path="$preferences_dir_path/$1.json"
  upd_url="https://clients2.google.com/service/update2/crx"
  mkdir -p "$preferences_dir_path"
  echo "{" >"$pref_file_path"
  echo "  \"external_update_url\": \"$upd_url\"" >>"$pref_file_path"
  echo "}" >>"$pref_file_path"
  echo Added \""$pref_file_path"\" ["$2"]
}

# install_chrome_extensions

install_chrome_extension "bnjjngeaknajbdcgpfkgnonkmififhfo" "Fake filler"
