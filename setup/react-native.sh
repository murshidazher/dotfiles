# TODO: Script under process
# https://www.chrisjmendez.com/2021/05/12/how-to-install-flutter-on-mac-osx-using-homebrew/
# https://reactnative.dev/docs/environment-setup
# https://stackoverflow.com/questions/64907154/android-studio-emulator-on-macos-with-arm-cpu-m1
# https://gist.github.com/bluenex/96a31acfebea4ad7b1b927b7125e4569
# https://gist.github.com/patrickhammond/4ddbe49a67e5eb1b9c03
# https://gist.github.com/ThePredators/064c46403290a6823e03be833a2a3c21

#!/usr/bin/env bash
debug=${1:-false}

# Load help lib if not already loaded.
if [ -z ${libloaded+x} ]; then
  source ./lib.sh
fi

# Set defaultdotfilesdir var if not declared.
if [ -z ${defaultdotfilesdir+x} ]; then
  defaultdotfilesdir="$HOME/dotfiles"
fi

bot "OK, what we're going to do:\n"
actioninfo "1. Install all dependencies for working with react native."
actioninfo "2. Install android studio and setup the Andorid SDK v29."
actioninfo "3. Configure xcode and cocoapods to work with flutter."

ask_for_confirmation "Ready?"
if answer_is_yes; then
  ok "Let's go."
else
  cancelled "Exit."
  exit -1
fi

# used by facebook to watch for file changes
brew install watchman

# Android
brew install ant maven gradle

brew install --cask android-sdk
brew install --cask android-ndk
brew install --cask android-platform-tools # for adb
brew install --cask android-studio
brew install --cask intel-haxm

cat <<'EOT' >~/.androidrc
export ANT_HOME=/usr/local/opt/ant
export MAVEN_HOME=/usr/local/opt/maven
export GRADLE_HOME=/usr/local/opt/gradle
export ANDROID_SDK_ROOT=/usr/local/share/android-sdk
export ANDROID_HOME=$ANDROID_SDK_ROOT
export ANDROID_NDK_HOME=/usr/local/opt/android-ndk
export PATH=$ANT_HOME/bin:$PATH
export PATH=$MAVEN_HOME/bin:$PATH
export PATH=$GRADLE_HOME/bin:$PATH
export PATH=$ANDROID_HOME/emulator:$PATH
export PATH=$ANDROID_HOME/tools/bin:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/build-tools/19.1.0:$PATH
EOT
echo "source ~/.androidrc" >>~/.bash_profile
source ~/.bash_profile

touch ~/.android/repositories.cfg

# setup the env to java 1.8 for sdkmanager
# bash -c 'JAVA_HOME=$(/usr/libexec/java_home -v 1.8)'
# bash -c 'INTEL_HAXM_HOME=/usr/local/Caskroom/intel-haxm'

sdkmanager --update
sdkmanager "platform-tools" "platforms;android-29"

# add to ~/.bash_rc file
# Android
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$ANDROID_HOME/emulator:$PATH"
export PATH="$ANDROID_HOME/tools:$PATH"
export PATH="$ANDROID_HOME/tools/bin:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"

# RUN IN EMULATOR (create an AVD using Pixel 2)
# Android Studio -> More actions -> AVD Manager -> Select Pixel 2 Image
# Create Virtual Device -> Select x86 Images Tab -> Q 29 (would be already downloaded) -> Next -> Finish
# https://developer.android.com/studio/command-line/avdmanager
# https://developer.android.com/studio/run/emulator-commandline

# ----------
# 3. Flutter
# ----------

flutter precache
flutter doctor --android-licenses

echo "Install XCode from MacStore"
read -p "Press [Enter] key when done..."

# sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
# sudo xcodebuild -runFirstLaunch
# sudo xcodebuild -license
open -a Simulator
sudo gem install cocoapods
pod setup

# skia
# https://developer.android.com/studio/run/emulator-acceleration
# ARM based chipset cant use the hardware acceleration
su
setprop debug.hwui.renderer skiagl
stop
start

flutter doctor

# react native
# use nvm or asdf version manager

if hash asdf 2>/dev/null; then

  local LATEST_NODEJS_14_VERSION=$(asdf list nodejs | grep '^  14\.' | tail -1 | sed 's: ::g')
  asdf local nodejs ${LATEST_NODEJS_14_VERSION}
  asdf reshim nodejs # to have all the globally install packages in PATH
  npm install -g react-native-cli

  # to see connected android devices
  # adb devices

  # fin.
else
  echo "WARNING: asdf not found."
fi
