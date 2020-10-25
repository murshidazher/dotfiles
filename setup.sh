#!/bin/sh

#                    _           _        _ _
#  ___  _____  __   (_)_ __  ___| |_ __ _| | |
# / _ \/ __\ \/ /   | | '_ \/ __| __/ _` | | |
#| (_) \__ \>  <    | | | | \__ \ || (_| | | |
# \___/|___/_/\_\   |_|_| |_|___/\__\__,_|_|_|

echo "📦 Mac OS Install Setup Script"
echo "By Murshid Azher"
echo "🐦 https://twitter.com/murshidazher"
echo "🐦 https://twitter.com/murshidazher"

# Some configs reused from:
# https://raw.githubusercontent.com/nnja/new-computer/master/setup.sh

# Colorize

# Set the colours you can use
black=$(tput setaf 0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)

# Resets to default graphic rendition
reset=$(tput sgr0)

# Color-echo.
# arg $1 = message
# arg $2 = Color
cecho() {
  echo "${2}${1}${reset}"
  return
}

echo ""
cecho "###############################################" $red
cecho "#        DO NOT RUN THIS SCRIPT BLINDLY       #" $red
cecho "#         YOU'LL PROBABLY REGRET IT...        #" $red
cecho "#                                             #" $red
cecho "#              READ IT THOROUGHLY             #" $red
cecho "#         AND EDIT TO SUIT YOUR NEEDS         #" $red
cecho "###############################################" $red
echo ""

# Set continue to false by default.
CONTINUE=false

echo ""
cecho "Have you read through the script? You're about to run and " $red
cecho "understood that it would make changes to your computer? (y/n)" $red
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  CONTINUE=true
fi

if ! $CONTINUE; then
  # Check if we're continuing and output a message if not
  cecho "Please go read the script, it only takes a few minutes" $red
  cecho "https://git.io/this-mac" $cyan
  exit
fi

# Here we go.. ask for the administrator password upfront and run a
# keep-alive to update existing `sudo` time stamp until script has finished
sudo -v
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

##############################
# Prerequisite: Install Brew #
##############################

echo "Installing brew..."

if test ! $(which brew); then
  ## Don't prompt for confirmation when installing homebrew
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" </dev/null
fi

# Latest brew, install brew cask
brew upgrade
brew update
brew tap caskroom/cask

#############################################
### Generate ssh keys & add to ssh-agent
### See: https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
#############################################

echo "Generating ssh keys, adding to ssh-agent..."
read -p 'Input email for ssh key: ' useremail

echo "Use default ssh file location, enter a passphrase: "
ssh-keygen -t rsa -b 4096 -C "$useremail" # will prompt for password
eval "$(ssh-agent -s)"

# Now that sshconfig is synced add key to ssh-agent and
# store passphrase in keychain
ssh-add -K ~/.ssh/id_rsa

# If you're using macOS Sierra 10.12.2 or later, you will need to modify your ~/.ssh/config file to automatically load keys into the ssh-agent and store passphrases in your keychain.

if [ -e ~/.ssh/config ]; then
  echo "ssh config already exists. Skipping adding osx specific settings... "
else
  echo "Writing osx specific settings to ssh config... "
  cat <<EOT >>~/.ssh/config
	Host *
		AddKeysToAgent yes
		UseKeychain yes
		IdentityFile ~/.ssh/id_rsa
EOT
fi

#############################################
### Add ssh-key to GitHub via api
#############################################

echo "Adding ssh-key to GitHub (via api)..."
echo "Important! For this step, use a github personal token with the admin:public_key permission."
echo "If you don't have one, create it here: https://github.com/settings/tokens/new"

retries=3
SSH_KEY=$(cat ~/.ssh/id_rsa.pub)

for ((i = 0; i < retries; i++)); do
  read -p 'GitHub username: ' ghusername
  read -p 'Machine name: ' ghtitle
  read -sp 'GitHub personal token: ' ghtoken

  gh_status_code=$(curl -o /dev/null -s -w "%{http_code}\n" -u "$ghusername:$ghtoken" -d '{"title":"'$ghtitle'","key":"'"$SSH_KEY"'"}' 'https://api.github.com/user/keys')

  if (($gh_status_code - eq == 201)); then
    echo "GitHub ssh key added successfully!"
    break
  else
    echo "Something went wrong. Enter your credentials and try again..."
    echo -n "Status code returned: "
    echo $gh_status_code
  fi
done

[[ $retries -eq i ]] && echo "Adding ssh-key to GitHub failed! Try again later."

##############################
# Install via Brew           #
##############################

echo "Starting brew app install..."

### Window Management
brew cask install sizeup # window manager

# Start SizeUp at login
defaults write com.irradiatedsoftware.SizeUp StartAtLogin -bool true

# Don’t show the preferences window on next start
defaults write com.irradiatedsoftware.SizeUp ShowPrefsOnNextStart -bool false

### Developer Tools
brew cask install iterm2
brew cask install dash
brew install ispell

### Development
brew cask install docker
brew install postgresql
brew install redis
