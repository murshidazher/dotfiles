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
    - [Updating vscode plugin list](#updating-vscode-plugin-list)
  - [Link](#link)
  - [Acknowledgements](#acknowledgements)
  - [License](#license)
    - [TODO](#todo)

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

### Updating vscode plugin list

Keeping the plugin list up to date requires manual work (like with Homebrew), and you can update the extension list by running:

```sh
codexm
```

## Link

A list of helpful links used to develop/inspire this project

- :zap: [tput colors](https://unix.stackexchange.com/questions/269077/tput-setaf-color-table-how-to-determine-color-codes)
- :burrito: [digital mac base icon](https://dribbble.com/shots/6185043-Pixelado) by Gustavo Zambelli

## Acknowledgements

Credit, inspiration and thanks to:

- [Mathias Bynens](https://github.com/mathiasbynens/dotfiles)
- [Simon Boudrias](https://github.com/SBoudrias/dotfiles)
- [Nina Zakharenko](https://github.com/nnja/new-computer)
- [Aaron Bates](https://github.com/aaronbates/dotfiles)

## License

[MIT](https://github.com/murshidazher/this-mac/blob/main/LICENSE) &copy; 2020 Murshid Azher ([https://murshidazher.com](https://murshidazher.com))

### TODO

- [ ] Install [VSCode Extensions](https://stackoverflow.com/questions/34286515/how-to-install-visual-studio-code-extensions-from-command-line) thorugh shell. For [code](https://stackoverflow.com/questions/30065227/run-open-vscode-from-mac-terminal) command.
- [ ] [All in one tutorial](https://dev-yakuza.github.io/en/environment/configure-development-environment-on-mac-with-homebrew-and-shell-script/)
- [ ] Update the `vscode.sh` with proper extension.
- [ ] Create custom `vscode` symlinks

- Add docker, kubctl.
- Add symlinks to host file
- Add docs on how to clean install and step to backup.
- Add react native settings and android, java jdk settings
- install `condamini` for ML tools
- [user groups](https://dzone.com/articles/how-to-use-linux-file-permissions-and-ownership-on)

- Running `brew search "/font-/"` will show you a list of all fonts that you can install this way.
- `asdf` make use of [miniconda](https://github.com/asdf-vm/asdf/issues/648)
- `asdf` manage `python3`(https://github.com/danhper/asdf-python)
- `$HOME/.default-python-packages` to specify default installed packages

- https://dev.to/0xdonut/how-to-install-flutter-on-macos-using-homebrew-and-asdf-3loa
- https://github.com/asdf-community/asdf-link
- https://www.rockyourcode.com/use-asdf-to-manage-multiple-versions-of-languages/
- https://nono.ma/python-3-default-macos#:~:text=While%20macOS%20ships%20with%20Python,install%20Python%203%20with%20Homebrew.&text=To%20make%20this%20new%20version,zshrc%20file.
- https://stackoverflow.com/questions/17901692/set-up-adb-on-mac-os-x

- `macs magnet` and add the version number of it
- https://github.com/masasam/dotfiles
- read about `git-crypt` [encryption](https://github.com/masasam/dotfiles)

- Add `hugo`, `typescript`, `angular`, `svelte`, `netlify`, `heroku`
