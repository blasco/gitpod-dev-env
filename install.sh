#!/bin/bash

# Set merge as the pull strategy
git config --global pull.rebase false

# Update dotfiles repo to latest
cd /home/gitpod/dotfiles
git pull
git submodule update --recursive --init

