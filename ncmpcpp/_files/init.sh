#!/bin/sh

source ${AG_SRC:-~/dotfiles}/script/_files/common.sh

PIP_PKGS=( "python-mpd2" "pylas" "discogs-client" )
pip_install "${PIP_PKGS[@]}"

pkg_install "ncmpcpp" "mpd ncmpcpp beets"

exit 0
