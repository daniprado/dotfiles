#!/usr/bin/env zsh

printf '\n%.0s' {1..100}
eval "$(oh-my-posh --init --shell zsh --config ~/.config/zsh/ag-pwlvl10k_rainbow.omp.json)"
if [[ -z "${NON_TRANSIENT_PROMPT}" ]]; then
  enable_poshtransientprompt
fi

