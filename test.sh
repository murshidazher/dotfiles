#!/usr/bin/env bash

# some bash library helpers
# @author Adam Eivy https://github.com/atomantic/dotfiles

debug=${1:-false} # default debug param.

source "$(curl -L https://git.io/dotfiles-mac-util-lib)"

# ----
# Prep
# ----
echo -e "📦 Mac Setup by [Murshid Azher](https://github.com/murshidazher/dotfiles)"
cancelled "Exit."
error "Something went wrong. When cloning the repo..."
success "Create a dev directory on root"
running "Cloning the repo from https://github.com/murshidazher/dotfiles to ~/dev/src/github"
