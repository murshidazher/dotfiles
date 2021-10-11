# TODO: Script under process
# https://www.chrisjmendez.com/2021/05/12/how-to-install-flutter-on-mac-osx-using-homebrew/
# https://reactnative.dev/docs/environment-setup
# https://github.com/scflode/dotfiles/tree/master/installer/versions - settings for versions

# install jetbrains-toolbox
brew install --cask jetbrains-toolbox

# used by facebook to watch for file changes
brew install watchman

# Android
brew install ant maven gradle
# Android-studio installed with jetbrains-toolbox
# brew install --cask android-studio
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

# Dart
brew tap dart-lang/dart
brew install dart

# Flutter
# https://flutter.dev/docs/get-started/install/macos
brew install --cask flutter

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

sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch
sudo xcodebuild -license
open -a Simulator
sudo gem install cocoapods
pod setup

# skia
# https://developer.android.com/studio/run/emulator-acceleration
su
setprop debug.hwui.renderer skiagl
stop
start

flutter doctor

brew install pidcat
