#!/usr/bin/env zsh
set -o errexit

expected="${1}"
conf_path="${XDG_CONFIG_HOME}/gtk-3.0"

cfg_color=$(cat "${conf_path}/themes/${expected}.ini" )
echo "${cfg_color}" | crudini --merge --inplace "${conf_path}/settings.ini" Settings

if [[ "${expected}" == "dark" ]]; then
  theme="gruvbox-dark-gtk"
else
  theme="earthy-gtk-theme"
fi
gsettings set org.gnome.desktop.interface gtk-theme "${theme}"

echo "Applied ${expected} to GTK!"
exit 0
