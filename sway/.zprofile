
typeset -U path
path=(~/.local/bin ~/go/bin /usr/share/icons/Papirus-Dark ~/.fonts $path[@])
export XDG_CONFIG_HOME=~/.config

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

