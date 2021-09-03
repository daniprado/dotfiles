export XDG_CONFIG_HOME=${HOME}/.config
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_TEMP_HOME=${HOME}/tmp
ZSHCONF=${XDG_CONFIG_HOME}/zsh
ZSHCACHE=${XDG_CACHE_HOME}/zsh

ZSH_AUTOSUGGEST_USE_ASYNC=true
HISTFILE="${ZSHCACHE}/histfile"
HISTSIZE=10000
SAVEHIST=10000

KEYTIMEOUT=1
CASE_SENSITIVE="true"

DIRSTACKFILE="${ZSHCACHE}/dirs"
DIRSTACKSIZE=20

typeset -U path
path=(~/.local/bin ~/.go/bin /snap/bin /usr/share/icons/Papirus-Dark ~/.local/share/fonts $path[@])

export GPG_TTY=$(tty)
export _Z_DATA="${HOME}/.cache/z"

# export ZSH_TMUX_AUTOSTART=true
# export ZSH_TMUX_AUTOSTART_ONCE=false
# export ZSH_TMUX_AUTOCONNECT=false
# export ZSH_TMUX_AUTOQUIT=false
export TMUX_PLUGIN_MANAGER_PATH="${XDG_CONFIG_HOME}/tmux/plugins"

export BORG_REMOTE_PATH="/usr/local/bin/borg1/borg1"
