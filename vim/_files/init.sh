#!/bin/sh

source ${AG_SRC:-~/dotfiles}/script/_files/common.sh

PIPX_PKGS=( "python-language-server[all]" )
pipx_install "${PIPX_PKGS[@]}"

pkg_install "vim"

exit 0
