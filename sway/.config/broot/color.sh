#!/usr/bin/env zsh
set -o errexit

expected="${1}"
conf_path="${XDG_CONFIG_HOME}/broot"

skin=$(hjson -j "${conf_path}/themes/ag-gruvbox_${expected}.hjson" | jq -r '.skin')
conf=$(hjson -j "${conf_path}/conf.hjson" | jq -r --arg skin "${skin}" '.skin|=($skin | fromjson)')
echo ${conf} | hjson > "${conf_path}/conf.hjson"

echo "Applied ${expected} to Broot!"
exit 0
