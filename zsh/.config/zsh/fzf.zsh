#!/usr/bin/env zsh

FZF_HOME=${XDG_SHARE_HOME}/fzf

export FZF_COMPLETION_TRIGGER='~~'
export FZF_TMUX=1
export FZF_TMUX_HEIGHT=15%
export FZF_COMPLETION_OPTS='+c -x'

if type fd > /dev/null; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude .cache --exclude .nvm --exclude .npm'
  export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
  export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git --exclude .cache --exclude .nvm --exclude .npm'
fi

[[ $- == *i* ]] && source "${FZF_HOME}/shell/completion.zsh" 2> /dev/null

source "${FZF_HOME}/shell/key-bindings.zsh"

