#!/usr/bin/env bash
debug=${1:-false}

# Load help lib if not already loaded.
if [ -z ${libloaded+x} ]; then
  source ./lib.sh
fi

# Set install flag to false
brewinstall=false

bot "Install Homebrew and all required apps."

ask_for_confirmation "\nReady to install apps? (get a coffee, this takes a while)"

# Flag install to go if user approves
if answer_is_yes; then
  ok
  brewinstall=true
else
  cancelled "Homebrew and applications not installed."
fi

if $brewinstall; then
  # Prevent sleep.
  caffeinate &

  action "Installing Homebrew"
  # Check if brew installed, install if not.
  if ! hash brew 2>/dev/null; then
    # note: if your /usr/local is locked down (like at Google), you can do this to place everything in ~/.homebrew
    # mkdir "$HOME/.homebrew" && curl -L https://github.com/mxcl/homebrew/tarball/master | tar xz --strip 1 -C $HOME/.homebrew
    # then add this to your path: export PATH=$HOME/.homebrew/bin:$HOME/.homebrew/sbin:$PATH
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    print_result $? 'Install Homebrew.'
  else
    success "Homebrew already installed."
  fi

  running "brew update + brew upgrade"
  # Make sure we’re using the latest Homebrew.
  brew update

  # Upgrade any already-installed formulae.
  brew upgrade

  # CORE

  running "Installing apps"
  # Install GNU core utilities (those that come with macOS are outdated).
  # Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
  brew install coreutils

  # Install some other useful utilities like `sponge`.
  brew install moreutils
  # Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
  brew install findutils
  # Install GNU `sed`, overwriting the built-in `sed`.
  brew install gnu-sed

  # Install Bash 4.
  # Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
  # running `chsh`.
  brew install bash
  brew install bash-completion2

  # Switch to using brew-installed bash as default shell
  if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
    echo '/usr/local/bin/bash' | sudo tee -a /etc/shells
    chsh -s /usr/local/bin/bash
  fi

  # zsh
  brew install zsh
  brew install zsh-completion

  # Install `wget` with IRI support.
  brew install wget

  # Install GnuPG to enable PGP-signing commits.
  brew install gnupg

  # Install more recent versions of some native macOS tools.
  brew install perl
  brew install vim --with-override-system-vi
  brew install grep
  brew install nano
  brew install openssh
  brew install screen

  # Key tools.
  brew install git
  brew install tmux
  brew install z

  # OTHER USEFUL UTILS
  brew install ack
  brew install advancecomp
  brew install brew-cask-completion
  brew install cloc
  brew install cmake
  brew install diff-so-fancy
  brew install fzf
  brew install gh
  brew install gibo && gibo -l
  brew install git-delta
  brew install git-extras
  brew install git-lfs
  brew install bfg
  brew install git-quick-stats
  brew install graphviz
  brew install grc
  brew install httpie
  brew install hub
  brew install icdiff
  brew install jq
  brew install m
  brew install mas
  brew install mtr
  brew install ngrep
  brew install nmap
  brew install p7zip
  brew install pidof
  brew install pigz
  brew install pv
  brew install readline
  brew install reattach-to-user-namespace
  brew install rename
  brew install roundup
  brew install spaceman-diff
  brew install spark
  brew install speedtest-cli
  brew install ssh-copy-id
  brew install terminal-notifier
  brew install the_silver_searcher
  brew install trash-cli
  brew install tree
  brew install m-cli
  brew install carlocab/personal/unrar
  brew install vbindiff
  brew install wifi-password
  brew install zopfli
  brew install thefuck
  brew install cppunit

  # BACKUP
  brew install mackup

  # DEVELOPMENT
  brew install adr-tools
  brew install asdf
  brew install yarn
  # brew install go
  # brew install homebrew/php/php56 --with-gmp
  brew install pyenv
  brew install pyenv-virtualenv
  brew install rbenv
  brew install ruby-build
  brew install rbenv-gemset
  brew install hugo
  brew install jsonnet

  # DATABASES
  brew install postgresql
  brew install mysql@5.7
  brew install redis

  brew tap mongodb/brew
  brew install mongodb-community
  brew install --cask mongodb-compass

  # DEVOPS
  brew install awscli
  brew install nginx
  brew install puma/puma/puma-dev

  # docker
  # brew install docker
  # brew install docker-compose
  # brew install docker-machine
  # brew install xhyve
  # brew install docker-machine-driver-xhyve
  # brew install boot2docker
  brew install --cask docker
  brew install kubectl

  # WEBFONT TOOLS
  running "Installing webfont tools"

  brew tap bramstein/webfonttools

  brew install sfnt2woff
  brew install sfnt2woff-zopfli
  brew install woff2

  # FONTS
  running "Installing fonts"

  brew tap murshidazher/homebrew-murshid
  brew tap homebrew/cask-fonts
  brew install svn

  brew install --cask font-domine
  brew install --cask font-droid-sans
  brew install --cask font-droid-sans-mono
  brew install --cask font-fira-code
  brew install --cask font-fira-sans
  brew install --cask font-fontawesome
  brew install --cask font-inconsolata
  brew install --cask font-inter
  brew install --cask font-lato
  brew install --cask font-open-sans
  brew install --cask font-roboto
  brew install --cask font-source-code-pro
  brew install --cask font-source-sans-pro
  brew install --cask font-ubuntu
  brew install --cask font-sanfrancisco

  running "Installing cask apps"

  # APPLICATIONS
  brew tap homebrew/cask
  brew tap homebrew/cask-versions

  # Security
  brew install --cask bitwarden
  brew install --cask keybase
  brew install --cask gpgtools
  brew install --cask tunnelblick
  # brew install --cask openvpn-connect

  # General
  brew install --cask caffeine
  brew install --cask diskwave
  brew install --cask dropbox
  brew install google-drive
  brew install --cask firefox
  brew install --cask g-desktop-suite
  brew install --cask google-chrome
  brew install --cask grammarly
  brew install --cask iterm2
  brew install --cask slack
  # brew install --cask spectacle
  brew install --cask spotify
  brew install --cask vlc
  brew install --cask numi
  brew install --cask notion
  brew install --cask simplenote
  brew install --cask appcleaner
  # brew install --cask adobe-acrobat-reader
  brew install --cask zoom
  brew install --cask whatsapp
  brew install --cask maccy

  # Design
  # brew install --cask abstract
  # brew install --cask sketch
  # brew install --cask zeplin
  brew install --cask fontbase # font management
  # brew install --cask iconjar

  # Cask outdated but versioned
  brew install --cask sketch@3.x # use version 63.x

  # Development
  brew install --cask dash
  brew install --cask brave-browser
  # brew install --cask google-chrome-canary
  brew install --cask graphiql
  brew install --cask imagealpha
  brew install --cask imageoptim
  brew install --cask ngrok
  brew install --cask sequel-pro # mysql management
  brew install --cask visual-studio-code
  brew install --cask airtable
  brew install --cask astah-uml
  brew install --cask intellij-idea-ce
  brew install --cask eclipse-jee

  # DevOps
  brew install --cask aws-vault
  brew install terraform
  brew install earthly/earthly/earthly

  # VM
  # brew install --cask virtualbox
  # brew install --cask vagrant

  # Quicklook
  brew install --cask qlcolorcode
  brew install --cask qlstephen
  brew install --cask qlmarkdown
  brew install --cask quicklook-json
  brew install --cask qlprettypatch
  brew install --cask quicklook-csv
  # brew install --cask betterzipql
  # brew install --cask qlimagesize
  brew install --cask webpquicklook
  # brew install --cask suspicious-package
  brew install --cask quicklookase
  brew install --cask qlvideo

  # Productivity
  brew install asciinema
  brew install gmailctl
  brew install --cask krisp
  brew install --cask recordit

  # Research
  brew install --cask zotero

  # Others
  brew install --cask cakebrew

  # DRIVERS
  running "Installing drivers"

  brew tap homebrew/cask-drivers

  brew install --cask logitech-options

  # Install Mac App Store Applications.
  # requires: brew install mas
  bot "Installing apps from the App Store..."

  ### find app ids with: mas search "app name"
  brew install mas

  ### Mas login is currently broken on mojave. See:
  ### Login manually for now.

  bot "\nNeed to log in to App Store manually to install apps with mas...."
  bot "Opening App Store. Please login."
  open "/Applications/App Store.app"

  ask_for_confirmation "\nIs app store login complete. (y/n)?"

  # Flag install to go if user approves
  # Make sure you have installed these app atleast once manually using your current account
  # else app store wouldn't let you download them
  # mas search <AppName>
  if answer_is_yes; then
    # mas install 1254981365 # Contrast
    # mas install 1234952668 # FlagTimes
    # mas install 1225570693 # Ulysses
    # TODO: install pixelsnap
    # mas install 907364780  # Tomato One - Pomodoro timer
    # mas install 485812721  # Tweetdeck
    mas install 668208984  # GIPHY Capture. The GIF Maker (For recording my screen as gif)
    mas install 1351639930 # Gifski, convert videos to gifs
    # mas install 414030210  # Limechat, IRC app.
    mas install 441258766  # Magnet
    mas install 1474276998 # HP Smart for Desktop
    mas install 490461369  # Bandwidth+
    mas instal 1056643111  # Clocker
  else
    cancelled "App Store login not complete. Skipping installing App Store Apps"
  fi

  running "brew cleanup"
  # Remove outdated versions from the cellar.
  brew cleanup

  # turn off prevent sleep.
  killall caffeinate
fi
