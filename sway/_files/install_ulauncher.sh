#!/bin/bash

source ${AG_SRC:-~/dotfiles}/script/_files/common.sh

PLUG_PATH="${AG_CONFIG}/ulauncher/user-themes/ulauncher-argallar-theme"
PLUG_URL=https://github.com/daniprado/ulauncher-argallar-theme.git

FOLDERS=( "${AG_CONFIG}/ulauncher/user-themes" )
create_folders "${FOLDERS[@]}"

PIP_PACKAGES=( "pint" "simpleeval" "parsedatetime" "pytz" )
pip_install "${PIP_PACKAGES[@]}"

clone_repo "${PLUG_URL}" "${PLUG_PATH}"

install "ulauncher" "echo \"TODO!! uLauncher not installed...\""

exit 0
