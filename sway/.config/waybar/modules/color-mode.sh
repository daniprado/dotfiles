#!/usr/bin/env bash

current=$(grep "set background=" ~/.config/nvim/init.vim | cut -d'=' -f 2)
printf '{"text":"%s", "class":"%s", "alt":"%s", "tooltip":"%s"}\n' "$current" "$current" "$current" "$current"

