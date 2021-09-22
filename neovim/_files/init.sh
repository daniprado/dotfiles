#!/bin/bash

source ${AG_SRC:-~/dotfiles}/script/_files/common.sh

NVIM_VERSION="v0.5.0"
NVIM_FOLDER="nvim-linux64"
NVIM_PATH="https://github.com/neovim/neovim/releases/download/${NVIM_VERSION}/${NVIM_FOLDER}.tar.gz"

FOLDERS=( "${AG_SHARE}/nvim" "${AG_CONFIG}/nvim" "${AG_CACHE}/nvim" )
create_folders "${FOLDERS[@]}"

PIP_PACKAGES=( "pynvim" )
pip_install "${PIP_PACKAGES[@]}"

PIPX_PACKAGES=( "neovim-remote" )
pipx_install "${PIPX_PACKAGES[@]}"

pkg_install "nvim" "neovim"
install "${cmd}" \
  "(cd \"${AG_TEMP}\"; \\
  curl -LO \"${NVIM_PATH}\"; \\
  tar xzvf \"./${NVIM_FOLDER}.tar.gz\"; \\
  cp -rf \"./${NVIM_FOLDER}/nvim ${AG_BIN}\"; \\
  chmod +x \"${AG_BIN}/nvim\")\""

exe "bash -c \"nvim --headless +PlugInstall +qa\""

exit 0
