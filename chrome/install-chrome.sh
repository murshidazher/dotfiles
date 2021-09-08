#!/usr/bin/env bash

# Set default extension URL base
URL_CHROME="https://clients2.google.com/service/update2/crx"

# Set global extensions installation path
PATH_CHROME_EXT="$HOME/Library/Application Support/Google/Chrome/External Extensions"

# Break the extension input to determine the slug and extension id
EXT_ARRAY=($(echo "$1" | tr '/' '\n'))
EXT_SLUG="${EXT_ARRAY[0]}"
EXT_ID="${EXT_ARRAY[1]}"

# Setup extension path
[ ! -d "$PATH_CHROME_EXT" ] && mkdir -p "$PATH_CHROME_EXT"

# Install extension
UID_ADDON_PATH="$PATH_CHROME_EXT/${EXT_ID}.json"

# Create extension file
echo "{" >"$UID_ADDON_PATH"
echo "  \"external_update_url\": \"$URL_CHROME\"" >>"$UID_ADDON_PATH"
echo "}" >>"$UID_ADDON_PATH"

# End message
echo Added \""$UID_ADDON_PATH"\" ["${EXT_SLUG}"]
