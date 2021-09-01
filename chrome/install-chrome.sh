#!/usr/bin/env bash

line="$1"
extArr=($(echo "$line" | tr '/' '\n'))
echo "${extArr[1]}"

preferences_dir_path="$HOME/Library/Application Support/Google/Chrome/External Extensions"
pref_file_path="$preferences_dir_path/${extArr[1]}.json"
upd_url="https://clients2.google.com/service/update2/crx"
mkdir -p "$preferences_dir_path"
echo "{" >"$pref_file_path"
echo "  \"external_update_url\": \"$upd_url\"" >>"$pref_file_path"
echo "}" >>"$pref_file_path"
echo Added \""$pref_file_path"\" ["${extArr[0]}"]
