if [[ -r "${XDG_CACHE_HOME}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  printf '\n%.0s' {1..100}
  source "${XDG_CACHE_HOME}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ${ZSHCONF}/zinit.zsh
source ${ZSHCONF}/fzf.zsh
source ${ZSHCONF}/asdf.zsh
source ${ZSHCONF}/functions.zsh

setopt autocd no_hup print_exit_value
setopt appendhistory share_history hist_ignore_all_dups
setopt auto_pushd pushd_silent pushd_to_home pushd_ignore_dups pushd_minus
unsetopt beep notify
ttyctl -f

autoload -Uz compinit && compinit
autoload -Uz promptinit && promptinit
autoload -U +X bashcompinit && bashcompinit

zle -N zle-expand-alias
zle -N fif
zle -N cal
zle -N zd
zle -N tree
zle -N zcd
zle -N gzt
zle -N cmd_tempos

for file in ${ZSHCONF}/completions/*.*sh; do
  source $file
done
eval "$(register-python-argcomplete pipx)"
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list ''
zstyle ':completion:*' verbose true
zstyle :compinstall filename '${HOME}/.zshrc'
zstyle ':completion:*' rehash true

bindkey -v
bindkey '^ ' autosuggest-accept
bindkey '^a' autosuggest-toggle
bindkey '^z' zle-expand-alias
bindkey '^K' up-history
bindkey '^J' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^e' cmd_tempos

if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi

autoload -Uz add-zsh-hook
if [[ "${TERM}" == (screen*|tmux*|xterm*) ]]; then
  add-zsh-hook -Uz precmd xterm_title_precmd
fi

unset SSH_AGENT_PID
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

source ${ZSHCONF}/alias.zsh

(( ! ${+functions[p10k]} )) || p10k finalize


source /home/dani/.config/broot/launcher/bash/br
