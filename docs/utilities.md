# Utilities

## Fonts

To list out all fonts that you can install,

```sh
> brew search "/font-/"
```

## mkcert

> 💡 For more information about setting up, go through the following docs. [ubuntu setup](https://kifarunix.com/create-locally-trusted-ssl-certificates-with-mkcert-on-ubuntu-20-04/) or [running Jekyll](https://diamantidis.github.io/tips/2020/06/26/serve-localhost-website-on-https-with-mkcert).

`mkcert` is a simple tool for making locally-trusted development certificates. It requires no configuration.

```sh
> mkcert -install
> mkcert example.com "*.example.com" example.test localhost 127.0.0.1 ::1
```

## MS office

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

## Google Drive

```sh
> brew install --cask google-drive-file-stream # google drive
> brew uninstall google-drive-file-stream
> brew install google-drive
```
