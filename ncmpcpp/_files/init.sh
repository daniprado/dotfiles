#!/bin/bash

BEETCOMP_URL="https://raw.githubusercontent.com/beetbox/beets/master/extra/_beet"

source ${AG_SRC:-~/dotfiles}/script/_files/common.sh

PIP_PKGS=( "python-mpd2" "pylas" "discogs-client" )
pip_install "${PIP_PKGS[@]}"

pkg_install "ncmpcpp" "mpd ncmpcpp beets"

(cd ${AG_CONFIG}/zsh/completions; \
  rm _beet || echo "Beets autocomplete not present"; \
  wget "${BEETCOMP_URL}")

exit 0
