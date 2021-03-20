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
    - [Rules of `dev` directory](#rules-of-dev-directory)
    - [Updating vscode plugin list](#updating-vscode-plugin-list)
  - [Link](#link)
    - [gpg sign](#gpg-sign)
  - [Acknowledgements](#acknowledgements)
  - [TODO](#todo)
  - [License](#license)

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


### Rules of `dev` directory

> outside the `src` we can have directory such as `sandbox` and etc...

There are some rules when naming a directory inside the `dev`;

- All directories are lowercase.
- All directories are kebab case (that I can control).
- There is a directory named `src`.
- `src` contains a directory for each git platform.
- Inside each git platform is only repo names.

### Updating vscode plugin list

Keeping the plugin list up to date requires manual work (like with Homebrew), and you can update the extension list by running:

```sh
codexm
```

## Link

A list of helpful links used to develop/inspire this project

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
- [SimonAdler](https://github.com/SimonAdler/dotfiles-1) - for BATS and Make file creations
- [webpro](https://github.com/webpro/dotfiles) - for react native setup

and many more...

## TODO

- [ ] Add react native settings and android
- [x] Running `brew search "/font-/"` will show you a list of all fonts that you can install this way.
- [x] `$HOME/.default-python-packages` to specify default installed packages
- [x] [https://dev.to/0xdonut/how-to-install-flutter-on-macos-using-homebrew-and-asdf-3loa](https://dev.to/0xdonut/how-to-install-flutter-on-macos-using-homebrew-and-asdf-3loa)
- [ ] [https://stackoverflow.com/questions/17901692/set-up-adb-on-mac-os-x](https://stackoverflow.com/questions/17901692/set-up-adb-on-mac-os-x)
- [ ] Add BATS tests
- [ ] Add make file installation

## License

[MIT](https://github.com/murshidazher/this-mac/blob/main/LICENSE) &copy; 2020 Murshid Azher.
