#!/bin/bash

source ${AG_SRC:-~/dotfiles}/script/_files/common.sh

LOCS=( "${AG_CONFIG}/ulauncher/user-themes" )
remove "${LOCS[@]}"

exit 0
