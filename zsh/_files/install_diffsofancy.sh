#!/bin/bash

DSF_URL="https://github.com/so-fancy/diff-so-fancy.git"
DSF_PATH="${AG_SHARE}/diff-so-fancy"

clone_repo ${DSF_URL} ${DSF_PATH}

create_link "${DSF_PATH}/diff-so-fancy" "${AG_BIN}/diff-so-fancy"

git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global interactive.diffFilter "diff-so-fancy --patch"

git config --global color.ui true

git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"

git config --global color.diff.meta       "11"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.func       "146 bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"

exit 0

