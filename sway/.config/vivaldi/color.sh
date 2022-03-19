#!/usr/bin/env zsh
set -o errexit

expected="${1}"
conf_path="${XDG_CONFIG_HOME}/vivaldi-stable.conf"
confelec_path="${XDG_CONFIG_HOME}/electron-flags.conf"

[[ "${expected}" == "dark" ]] && color_flag="--force-dark-mode" || color_flag=""
cat "${confelec_path}" > "${conf_path}"
echo "${color_flag}" >> "${conf_path}"

zip ${XDG_CONFIG_HOME}/vivaldi/themes/argallar.zip ${XDG_CONFIG_HOME}/vivaldi/themes/argallar/*

echo "Applied ${expected} to Vivaldi!"
exit 0
