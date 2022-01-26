export XDG_CONFIG_HOME=${HOME}/.config
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_SHARE_HOME=${HOME}/.local/share
export XDG_BIN_HOME=${HOME}/.local/bin
export XDG_TEMP_HOME=${HOME}/tmp
export TMP=${XDG_TEMP_HOME}
ZSHSHARE=${XDG_SHARE_HOME}/zsh
ZSHCONF=${XDG_CONFIG_HOME}/zsh
ZSHCACHE=${XDG_CACHE_HOME}/zsh
ZSHMAN=${XDG_SHARE_HOME}/man
ZSHMAN_1=${ZSHMAN}/man1

ZSH_AUTOSUGGEST_USE_ASYNC=true
HISTFILE="${ZSHCACHE}/histfile"
DIRSTACKFILE="${ZSHCACHE}/dirs"
HISTSIZE=10000
SAVEHIST=10000
DIRSTACKSIZE=100
KEYTIMEOUT=1
CASE_SENSITIVE="true"

typeset -U path
path=(${XDG_BIN_HOME} ${XDG_SHARE_HOME}/fonts $path[@])
export MANPATH=${XDG_SHARE_HOME}/man:${MANPATH}

export WLR_NO_HARDWARE_CURSORS=1

export TMUX_CONFIG="${HOME}/.tmux.conf"
export TMUX_PLUGIN_MANAGER_PATH="${XDG_SHARE_HOME}/tmux/plugins"
# export ZSH_TMUX_AUTOSTART=true
# export ZSH_TMUX_AUTOSTART_ONCE=false
# export ZSH_TMUX_AUTOCONNECT=false
# export ZSH_TMUX_AUTOQUIT=false

export BORG_REMOTE_PATH="/usr/local/bin/borg1/borg1"

export ASDF_DIR=${ZSHSHARE}/zinit/plugins/asdf-vm---asdf
export ASDF_DATA_DIR=${ASDF_DIR}
export ASDF_CONFIG_FILE=${ASDF_DIR}/asdfrc
