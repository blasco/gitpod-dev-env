#!/bin/bash

# Gitpod config, it requires that the repo uses the gitpod-dev docker hub image

# Set merge as the pull strategy
git config --global pull.rebase false

# Update dotfiles repo to latest
cd /home/gitpod/dotfiles
git pull
git submodule update --recursive --init

