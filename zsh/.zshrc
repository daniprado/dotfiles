source ${ZSHCONF}/zinit.zsh
source ${ZSHCONF}/functions.zsh

setopt autocd no_hup print_exit_value
setopt inc_append_history share_history hist_ignore_all_dups extended_history
setopt auto_pushd pushd_silent pushd_to_home pushd_ignore_dups pushd_minus
unsetopt beep notify
ttyctl -f

zle -N zle-expand-alias
zle -N fif
zle -N fifall
zle -N cal
zle -N tree
zle -N cmd_tempos
zle -N cd_dirs

bindkey -v
bindkey '^ ' autosuggest-accept
bindkey '^a' autosuggest-toggle
bindkey '^z' zle-expand-alias
bindkey '^k' up-history
bindkey '^j' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '\ed' cd_dirs

# Reload last visited location
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi

autoload -Uz add-zsh-hook
[[ "${TERM}" == (screen*|tmux*|xterm*) ]] && add-zsh-hook -Uz precmd xterm_title_precmd

# Single NVim instance while inside tmux session
[[ ! -z "${TMUX}" ]] && export NVIM_LISTEN_ADDRESS="${TMP}/nvimsocket_$(curr_dk)"

source ${ZSHCONF}/fzf.zsh
source ${ZSHCONF}/alias.zsh
source ${ZSHCONF}/gpg-init.zsh
source ${ZSHCONF}/prompt.zsh
[[ -f "${ZSHCONF}/theme.zsh" ]] && source ${ZSHCONF}/theme.zsh
