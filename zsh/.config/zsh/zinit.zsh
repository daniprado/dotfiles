#!/usr/bin/env zsh

ZINIT_HOME=${ZSHSHARE}/zinit
ZPFX=${ZINIT_HOME}/polaris
declare -A ZINIT
ZINIT[HOME_DIR]=${ZINIT_HOME}
ZINIT[BIN_DIR]=${ZINIT_HOME}/bin
ZINIT[PLUGINS_DIR]=${ZINIT_HOME}/plugins
ZINIT[COMPLETIONS_DIR]=${ZINIT_HOME}/completions
ZINIT[SNIPPETS_DIR]=${ZINIT_HOME}/snippets
ZINIT[ZCOMPDUMP_PATH]=${HOME}/.zcompdump
ZINIT[COMPINIT_OPTS]="-C"
ZINIT[MUTE_WARNINGS]="1"
ZINIT[OPTIMIZE_OUT_DISK_ACCESSES]="1"

source ${ZINIT_HOME}/bin/zinit.zsh

svn=""
# type "svn" >/dev/null && svn="svn"

zt(){ zinit $svn depth'1' reset light-mode lucid "${@}"; }
ztp(){ zinit depth'1' reset light-mode lucid "${@}"; }

ztp for                                                 \
  nocd atload"source ${ZSHCONF}/theme.zsh; _p9k_precmd" \
      romkatv/powerlevel10k                             \
      zdharma-continuum/z-a-bin-gem-node

ztp wait'0' for                                                 \
  atload'alias lsa="exa --long --all --modified --git --group"' \
      OMZL::directories.zsh                                     \
      OMZP::git                                                 \
  atload'!_zsh_autosuggest_start'                               \
      zsh-users/zsh-autosuggestions                             \
      OMZL::clipboard.zsh                                       \
      zsh-vi-more/vi-motions                                    \
      djui/alias-tips                                           \
  pick'asdf.sh'                                                 \
      @asdf-vm/asdf                                             \
  as'completion' blockf                                         \
      OMZP::ripgrep/_ripgrep

DIRENV_VER="*linux-amd64*"
DUF_VER="*linux_x86_64*"
BROOT_VER="*x86_64-linux*"
NVIM_VER="nvim.appimage"

ztp wait'0' as'command' for                              \
  sbin'jq' from'gh-r'                                    \
  atclone'cp jq* jq' atpull'%atclone'                    \
      stedolan/jq                                        \
  sbin'direnv' from'gh-r' bpick"${DIRENV_VER}"           \
  atclone'./direnv hook zsh >zhook.zsh' atpull'%atclone' \
  src='zhook.zsh' mv'direnv* -> direnv'                  \
      direnv/direnv                                      \
  sbin'**/fd' from'gh-r'                                 \
  atclone"cp **/fd.1 ${ZSHMAN_1}" atpull'%atclone'       \
      @sharkdp/fd                                        \
  sbin'diff-so-fancy'                                    \
      so-fancy/diff-so-fancy

ztp wait'0' as'command' for              \
  sbin'bin/exa' from'gh-r'               \
  trigger-load'!ls;!lsa;!lst;!exa'       \
  atclone"
    cp **/exa.zsh _exa; \
    cp **/exa.1 ${ZSHMAN_1}; \
    cp **/exa*.5 ${ZSHMAN}/man5
  " atpull'%atclone'                     \
      ogham/exa                          \
  sbin'**/bat' from'gh-r'                \
  trigger-load'!cat;!bat'                \
  atclone"
    cp **/bat.zsh _bat; \
    cp **/bat.1 ${ZSHMAN_1}
  " atpull'%atclone'                     \
      @sharkdp/bat                       \
  sbin'broot' from'gh-r'                 \
  trigger-load'!br;!broot'               \
  atclone"
    cp **/${BROOT_VER}/broot broot; cp **/br*.1 ${ZSHMAN_1}; \
    ./broot --print-shell-function zsh >zhook.zsh; \
    ./broot --set-install-state installed
  " atpull'%atclone' src='zhook.zsh'     \
      Canop/broot                        \
  sbin'duf' from'gh-r' bpick"${DUF_VER}" \
  trigger-load'!df;!duf'                 \
      muesli/duf                         \
  trigger-load'!hcurl'                   \
  sbin'httpstat.sh -> hcurl'             \
      b4b4r07/httpstat                   \
  trigger-load'!you-get'                 \
      soimort/you-get

# Min Neovim version is 0.6.0
CURR_NVIM_VER=$(nvim --version | grep -m 1 "NVIM" | cut -d'.' -f2)
ztp wait'0' as'command' for                 \
  load"[[ ${CURR_NVIM_VER} -lt 6 ]]"        \
  sbin'nvim.appimage -> nvim'               \
  from'gh-r' ver'stable' bpick"${NVIM_VER}" \
      neovim/neovim

zt wait'0' for                                        \
  trigger-load'!man'                                  \
      ael-code/zsh-colored-man-pages                  \
  has'tmux' trigger-load'!tmux'                       \
      OMZP::tmux                                      \
  trigger-load'!cpv'                                  \
      OMZP::cp                                        \
  trigger-load'!copyfile'                             \
      OMZP::copyfile                                  \
  trigger-load'!copybuffer'                           \
      OMZP::copybuffer                                \
  trigger-load'!copydir'                              \
      OMZP::copydir                                   \
  trigger-load'!trans'                                \
  atclone"cp **/trans.1 ${ZSHMAN_1}" atpull'%atclone' \
      soimort/translate-shell                         \
  has'terraform' trigger-load'!terraform;!tf'         \
      OMZP::terraform                                 \
  has'helm' trigger-load'!helm'                       \
      OMZP::helm                                      \
  has'pip' trigger-load'!pip'                         \
  as'completion' blockf                               \
      OMZP::pip/_pip                                  \
  has'docker-compose' trigger-load'!docker-compose'   \
  as'completion' blockf                               \
      OMZP::docker-compose/_docker-compose

ztp wait'1' for                        \
      OMZL::completion.zsh             \
  blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions        \
  atinit'zicompinit; zicdreplay'       \
      zsh-users/zsh-syntax-highlighting
