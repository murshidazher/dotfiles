# TODO: Script under process
# https://www.chrisjmendez.com/2021/05/12/how-to-install-flutter-on-mac-osx-using-homebrew/
# https://reactnative.dev/docs/environment-setup
# https://github.com/scflode/dotfiles/tree/master/installer/versions - settings for versions
# https://stackoverflow.com/questions/64907154/android-studio-emulator-on-macos-with-arm-cpu-m1

# used by facebook to watch for file changes
brew install watchman

# Ant
action "asdf: setting up Ant"
asdf plugin add ant

local LATEST_ANT_VERSION=$(asdf list-all ant | grep '^3\.' | grep -v '\-dev\|rc' | grep -v 'b\d\+' | tail -1)

# install
action "asdf: installing global versions of ant $LATEST_ANT_VERSION"
asdf install ant "${LATEST_ANT_VERSION}"
asdf global ant "${LATEST_ANT_VERSION}"
# ant -version

# maven
action "asdf: setting up Maven"
asdf plugin-add maven

local LATEST_MAVEN_VERSION=$(asdf list-all maven | grep '^3\.' | grep -v '\-dev\|rc' | grep -v 'b\d\+' | tail -1)

# install
action "asdf: installing global versions of maven $LATEST_MAVEN_VERSION"
asdf install maven "${LATEST_MAVEN_VERSION}"
asdf global maven "${LATEST_MAVEN_VERSION}"

# gradle
action "asdf: setting up Gradle"
asdf plugin-add gradle

local LATEST_MAVEN_VERSION=$(asdf list-all maven | grep '^3\.' | grep -v '\-dev\|rc' | grep -v 'b\d\+' | tail -1)

# install
action "asdf: installing global versions of maven $LATEST_MAVEN_VERSION"
asdf install gradle "${LATEST_MAVEN_VERSION}"
asdf global gradle "${LATEST_MAVEN_VERSION}"

# Android
brew install ant maven gradle

brew install --cask android-sdk
brew install --cask android-ndk
brew install --cask android-platform-tools

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

sdkmanager --update
sdkmanager "platform-tools" "platforms;android-29"

# Flutter

# Flutter fvm
pub global activate fvm
echo "export ANDROID_HOME=/usr/local/share/android-sdk" >>~/.bash_profile
cat <<'EOT' >~/.flutterrc
export FLUTTER_HOME=/usr/local/share/flutter-sdk
# Flutter binaries
export PATH=$FLUTTER_HOME/flutter/bin:$PATH
# fvm binaries
export PATH=~/.pub-cache/bin:$PATH
EOT
echo "source ~/.flutterrc" >>~/.bash_profile
source ~/.bash_profile

fvm install 1.12.13
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
