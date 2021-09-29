#!/bin/bash

source ${AG_SRC:-~/dotfiles}/script/_files/common.sh

LOCS=( "${AG_SHARE}/nvim" "${AG_CONFIG}/nvim" "${AG_CACHE}/nvim" )
remove "${LOCS[@]}"

exit 0
