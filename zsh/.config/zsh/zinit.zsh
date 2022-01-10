#!/usr/bin/env zsh

ZINIT_HOME=${ZSHCONF}/zinit
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

source ${ZSHCONF}/zinit/bin/zinit.zsh

svn=""
if type "svn" >/dev/null; then
    svn="svn"
fi
zt(){ zinit $svn depth'3' lucid ${1/#[0-9][a-c]/wait"${1}"} "${@:2}"; }
ztp(){ zinit depth'3' lucid ${1/#[0-9][a-c]/wait"${1}"} "${@:2}"; }

zinit light-mode compile'handler' for \
    zdharma-continuum/z-a-patch-dl            \
    zdharma-continuum/z-a-as-monitor          \
    zdharma-continuum/z-a-bin-gem-node        \
    zdharma-continuum/z-a-submods             \
    zdharma-continuum/declare-zsh

ztp atload'source ${ZSHCONF}/theme.zsh; _p9k_precmd' nocd light-mode for \
    romkatv/powerlevel10k

zinit wait lucid light-mode for \
    OMZ::lib/functions.zsh      \
    OMZ::lib/clipboard.zsh      \
	OMZ::lib/correction.zsh     \
	OMZ::lib/completion.zsh     \
    atload"
        # FIXME
        if type 'exa' >/dev/null; then
            alias lsa='exa --long --all --modified --git --group'
        fi
    "                           \
	OMZ::lib/directories.zsh

cmd_tempos(){ zinit wait lucid light-mode for OMZ::lib/key-bindings.zsh }

ztp light-mode for                           \
        zsh-users/zsh-syntax-highlighting    \
    atload'!_zsh_autosuggest_start'          \
        zsh-users/zsh-autosuggestions        \
    blockf                                   \
        zsh-users/zsh-completions            \
    as'completion'                           \
        OMZP::pip

zt light-mode for                   \
    OMZP::git                       \
    OMZP::git-auto-fetch            \
    OMZP::alias-finder              \
    OMZP::tmux                      \
    OMZP::cp

ztp light-mode for                  \
    rupa/z                          \
    djui/alias-tips                 \
    b4b4r07/zsh-vimode-visual       \
    mrkmg/borgbackup-zsh-completion \
    zsh-vi-more/vi-quote            \
    zsh-vi-more/vi-motions          \
    zsh-vi-more/ex-commands         \
    zsh-vi-more/evil-registers      \
    carlocab/tmux-nvr               \
    soimort/translate-shell

ztp as'command' light-mode for \
    pick'bin/git-fuzzy'        \
        bigH/git-fuzzy         \
    sbin'diff-so-fancy'        \
        so-fancy/diff-so-fancy \
    sbin'httpstat.sh -> hcurl' \
        b4b4r07/httpstat

zt light-mode for                      \
    trigger-load'!man'                 \
        ael-code/zsh-colored-man-pages \
    trigger-load'!copyfile'            \
        OMZP::copyfile                 \
    trigger-load'!copybuffer'          \
        OMZP::copybuffer               \
    trigger-load'!copydir'             \
        OMZP::copydir                  \
    trigger-load'!terraform'           \
        OMZP::terraform                \
    trigger-load'!helm'                \
        OMZP::helm

zt light-mode as'complete' for               \
    trigger-load'!docker'                    \
        OMZP::docker/_docker                 \
    trigger-load'!docker-compose'            \
        OMZP::docker-compose/_docker-compose \
    trigger-load'!terraform'                 \
        OMZP::terraform/_terraform           \
    trigger-load'!helm'                      \
        OMZP::helm

if type "rg" >/dev/null; then
    ztp light-mode as'completion' for \
        OMZP::ripgrep/_ripgrep
fi

if type "bat" >/dev/null; then
    ztp from'gh-r' atclone'cp **/*.zsh _bat' atpull'%atclone' light-mode for \
        @sharkdp/bat
fi

if type "exa" >/dev/null; then
    ztp atclone'cp **/*.zsh _exa' atpull'%atclone' light-mode for \
        ogham/exa
fi

if type "fd" >/dev/null; then
    ztp from'gh-r' atclone'cp **/_fd _fd' atpull'%atclone' light-mode for \
        @sharkdp/fd
fi

