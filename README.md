<img src="https://raw.githubusercontent.com/murshidazher/this-mac/main/docs/logo.jpg" width="90px">

# [dotfiles](https://git.io/dotfiles-mac)

> My personal installation script to automate any new macOS system setup so I don't need to feel poor.

- A dogmatic script to set up script. Built for Mac OS X :fire: :fire:

## Table of Contents

- [dotfiles](#dotfiles)
  - [Table of Contents](#table-of-contents)
  - [Installing / Getting started](#installing--getting-started)
    - [Setup](#setup)
  - [What's in the box](#whats-in-the-box)
    - [Highlights](#highlights)
    - [Basic](#basic)
    - [Development](#development)
    - [Rules of `dev` directory](#rules-of-dev-directory)
    - [Updating vscode plugin list](#updating-vscode-plugin-list)
  - [Link](#link)
    - [gpg sign](#gpg-sign)
  - [Acknowledgements](#acknowledgements)
  - [License](#license)
    - [TODO](#todo)
    - [Java](#java)
    - [Python](#python)
      - [httpie](#httpie)
      - [MS office](#ms-office)
      - [Google Drive](#google-drive)
    - [AndroidStudio](#androidstudio)
    - [R](#r)
      - [Initial R packages](#initial-r-packages)

## Installing / Getting started

> ⚠️ Scripts in this project performs automated tasks. Review the code first and use at your own risk! ⚠️

### Setup

To setup simply open the terminal, then:

```sh
bash -c "`curl -L https://git.io/dotfiles-mac`"
```

## What's in the box

### Highlights

- **Basic Tools** [Homebrew]() - Package Manager for macOS
- [Cask](https://github.com/Homebrew/homebrew-cask) - speed installation and management of GUI macOS applications.
- [mas](https://github.com/mas-cli/mas) - to install AppStore applications

### Basic

- [Magnet](https://magnet.crowdcafe.com/) - Window manager
- [iterm2]() -
- [dash](https://kapeli.com/dash) - API documentation set
- [ispell](https://www.gnu.org/software/ispell/) - spelling checker for Unix

### Development

- [docker]()
- [postgresql]()
- [redis]()

### Rules of `dev` directory

> outside the `src` we can have directory such as `sandbox` and etc...

There are some rules when naming a directory inside the `dev`;
- all directories are lowercase
- all directories are kebab case (that I can control)
- there is a directory named src
- src contains a directory for each git platform
- inside each git platform is only repo names

### Updating vscode plugin list

Keeping the plugin list up to date requires manual work (like with Homebrew), and you can update the extension list by running:

```sh
codexm
```

## Link

A list of helpful links used to develop/inspire this project

- :zap: [tput colors](https://unix.stackexchange.com/questions/269077/tput-setaf-color-table-how-to-determine-color-codes)
- :burrito: [digital mac base icon](https://dribbble.com/shots/6185043-Pixelado) by Gustavo Zambelli

### gpg sign

```sh
> gpg --list-keys
> git config --global user.signingkey [public key ID]
```

## Acknowledgements

Credit, inspiration and thanks to:

- [Mathias Bynens](https://github.com/mathiasbynens/dotfiles)
- [Simon Boudrias](https://github.com/SBoudrias/dotfiles)
- [Nina Zakharenko](https://github.com/nnja/new-computer)
- [Aaron Bates](https://github.com/aaronbates/dotfiles)

and many more...

## License

[MIT](https://github.com/murshidazher/this-mac/blob/main/LICENSE) &copy; 2020 Murshid Azher ([https://murshidazher.com](https://murshidazher.com))

### TODO

- [ ] [All in one tutorial](https://dev-yakuza.github.io/en/environment/configure-development-environment-on-mac-with-homebrew-and-shell-script/)

- [ ] Add react native settings and android
- [ ] [user groups](https://dzone.com/articles/how-to-use-linux-file-permissions-and-ownership-on)
- [ ] Running `brew search "/font-/"` will show you a list of all fonts that you can install this way.
- [ ] `$HOME/.default-python-packages` to specify default installed packages
- [ ] https://dev.to/0xdonut/how-to-install-flutter-on-macos-using-homebrew-and-asdf-3loa
- [ ] https://github.com/asdf-community/asdf-link
- [ ] https://www.rockyourcode.com/use-asdf-to-manage-multiple-versions-of-languages/
- [ ] https://nono.ma/python-3-default-macos#:~:text=While%20macOS%20ships%20with%20Python,install%20Python%203%20with%20Homebrew.&text=To%20make%20this%20new%20version,zshrc%20file.
- [ ] https://stackoverflow.com/questions/17901692/set-up-adb-on-mac-os-x
- [ ] [kubectl cheatsheet](https://medium.com/better-programming/useful-kubectl-aliases-that-will-speed-up-your-coding-54960185d10)
- [ ] `macs magnet` and add the version number of it
- [ ] https://github.com/masasam/dotfiles
- [ ] read about `git-crypt` [encryption](https://github.com/masasam/dotfiles)
- [ ] Add `hugo`, `typescript`, `angular`, `svelte`, `netlify`, `heroku`
- [ ] See `OpenVPN` config files to add to tunnelblick
- [ ] [How to setup tunnelblick](https://www.ovpn.com/en/guides/mac-tunnelblick)

### Java

```sh
> asdf plugin-add java
> asdf list-all java
> asdf install java corretto-15.0.2.7.1
> asdf global java corretto-15.0.2.7.1
> brew install --cask intellij-idea-ce
```

```sh
JAVA_HOME=". ~/.asdf/plugins/java/set-java-home.bash"
```

### Python

```sh
> asdf plugin-add java
> asdf list-all java
> asdf install java corretto-15.0.2.7.1
> asdf global java corretto-15.0.2.7.1
> brew install --cask intellij-idea-ce
```

```sh
JAVA_HOME=". ~/.asdf/plugins/java/set-java-home.bash"
```

#### httpie

```sh
> http PUT httpbin.org/put X-API-Token:123 name=John
```

#### MS office

```sh
> brew install --cask microsoft-office # if we need all packages
> brew install --cask microsoft-word 
> brew install --cask microsoft-excel
> brew install --cask microsoft-powerpoint
> brew install --cask microsoft-teams
> brew install --cask microsoft-auto-update # for updates
> brew upgrade # single command to update all apps
> brew update # updates homebrew casks
> bwclean # to clean all cache of homebrew for optimal performance
```

#### Google Drive

```sh
> brew install --cask google-drive-file-stream # google drive
```

### AndroidStudio

```sh
> brew install gradle # openjdk	15.0.1
> brew install --cask android-studio
# Android 
export ANDROID_HOME="/usr/local/share/android-sdk"
export ANDROID_SDK_ROOT=/Users/ciandroid/android-sdk-macosx
export PATH=$PATH:$ANDROID_SDK_ROOT/tools
```

### R

> Dont install r from brew because of binary issues, set it up using this [article](https://ryanhomer.github.io/posts/build-openmp-macos-catalina-complete#install-r-studio)

- It is possible to get X11-related warnings or erros when installing packages or loading other R libraries. If at any point you need to install X11,

```sh
> brew cask install xquartz
```

#### Initial R packages

> Installed R packages are at `‘/usr/local/Cellar/r/4.0.3_2/lib/R/library/DT’`

```sh
> install.packages("devtools")
> library(devtools)
> devtools::install_github("rstudio/reticulate")
> devtools::install_github("rstudio/tensorflow")
> library(tensorflow)
> install_tensorflow()
```
