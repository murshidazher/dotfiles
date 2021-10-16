# TODO: Script under process
# https://www.chrisjmendez.com/2021/05/12/how-to-install-flutter-on-mac-osx-using-homebrew/
# https://reactnative.dev/docs/environment-setup
# https://stackoverflow.com/questions/64907154/android-studio-emulator-on-macos-with-arm-cpu-m1

# used by facebook to watch for file changes
brew install watchman

# Android
brew install ant maven gradle

brew install --cask android-sdk
brew install --cask android-ndk
brew install --cask android-platform-tools
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

# Flutter

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
