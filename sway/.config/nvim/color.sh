#!/usr/bin/env zsh
set -o errexit

expected="${1}"
conf_path="${XDG_CONFIG_HOME}/nvim"

vim_c="${expected}"
sed -i -E "s/(.*set background=).*/\1${vim_c}/" "${conf_path}/init.vim"

ag-nvim-broadcast "set background=${expected}"

echo "Applied ${expected} to NVim!"
exit 0
