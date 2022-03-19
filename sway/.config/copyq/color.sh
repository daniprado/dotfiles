#!/usr/bin/env zsh
set -o errexit

expected="${1}"
conf_path="${XDG_CONFIG_HOME}/copyq"

theme=$(sed 's/General/Theme/' "${conf_path}/ag-base16.ini")
echo "${theme}" | crudini --merge --inplace "${conf_path}/copyq.conf" Theme

echo "Applied ${expected} to CopyQ!"
exit 0
