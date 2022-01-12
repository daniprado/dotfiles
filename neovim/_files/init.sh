#!/bin/bash

source ${AG_SRC:-~/dotfiles}/script/_files/common.sh

FOLDERS=( "${AG_SHARE}/nvim" "${AG_CONFIG}/nvim" "${AG_CACHE}/nvim" )
create_folders "${FOLDERS[@]}"

PIP_PACKAGES=( "pynvim" "tasklib" )
pip_install "${PIP_PACKAGES[@]}"

PIPX_PACKAGES=( "neovim-remote" )
pipx_install "${PIPX_PACKAGES[@]}"

pkg_install "nvim" "neovim"

# Usual dependencies
pkg_install "libsqlite3-dev"
pkg_install "npm"
pkg_install "unzip"

exe "bash -c \"nvim --headless +PlugInstall +qa\""

exit 0
