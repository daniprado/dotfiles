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
pkg_install "libsqlite3-dev" "libsqlite3-dev" "sqlite-devel"
pkg_install "npm"
pkg_install "unzip"

CURR_NVIM_VER=$(nvim --version | grep -m 1 "NVIM" | cut -d'.' -f2)
# Min Neovim version is 0.7.0
if [[ ${CURR_NVIM_VER} -ge 7 ]]; then
  exec "bash -c \"nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'\""
fi

exit 0
