#!/bin/bash

# Update dotfiles repo to latest
cd /home/gitpod/dotfiles
git pull
git submodule update --recursive --init

