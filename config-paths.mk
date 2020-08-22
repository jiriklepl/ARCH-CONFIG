.PHONY: print_deps print_aur_deps print_all_deps

# using trailing / to distinguish folders from files
OPENBOX_DIR := .config/openbox/
POLYBAR_DIR := .config/polybar/
DUNST_DIR   := .config/dunst/
XFCE_DIR    := .config/xfce4/
COPYQ       := .config/copyq/copyq-commands.ini
TMUX        := .tmux.conf
ZSH         := .config/zsh/.zshrc
NEWSBOAT    := .newsboat

HOME := ${HOME}
HOME_CONFIGS := \
	${OPENBOX_DIR} \
	${POLYBAR_DIR} \
	${DUNST_DIR} \
	${XFCE_DIR} \
	${COPYQ} \
	${TMUX} \
	${ZSH} \
	${NEWSBOAT}

HOME_CONFIGS_ABSOLUTE := $(patsubst %, ${HOME}/%, ${HOME_CONFIGS})

# Desktop environment things
DISPLAY_MANAGER      := slim
WM_MANAGER           := openbox
COMPOSITE_MANAGER    := xcompmgr
DESKTOP_MANAGER      := xfdesktop
NOTIFICATION_MANAGER := dunst
FILE_MANAGER         := thunar
IMAGE_VIEWER         := feh
CLIPBOARD_MANAGER    := copyq

# Fast things
FAST_SHELL           := dash
FAST_AWK             := nawk

# Workflow things
NICE_SHELL           := zsh
TERM                 := st
EDITOR               := visual-studio-code-bin
BROWSER              := google-chrome-beta
RSS_READER           := newsboat

# Programming
HASKELL              := ghc ghc-static cabal-install
C_CPP                := gcc clang bison flex
JAVASCRIPT           := nodejs

# Debugging
DEBUG_UTILS          := gdb strace ltrace valgrind

# {{{ Packages:

DE_PCKGS := \
	${FILE_MANAGER} \
	${WM_MANAGER} \
	${DISPLAY_MANAGER} \
	${DESKTOP_MANAGER} \
	${COMPOSITE_MANAGER} \
	${IMAGE_VIEWER} \
	${RSS_READER} \
	${NOTIFICATION_MANAGER} \
	${CLIPBOARD_MANAGER}

DE_UTILITY_PCKGS      := slop zenity shotgun wmctrl xorg-xprop
SOUND_PCKGS           := alsa-plugins alsa-utils pulseaudio
BASIC_UTILITY_PCKGS   := ${FAST_SHELL} ${FAST_AWK} ${NICE_SHELL} tmux htop
GENERAL_UTILITY_PCKGS := zip unzip
PDF_PCKGS             := zathura zathura-pdf-poppler pdfgrep
PRG_PCKGS             := ${HASKELL} ${C_CPP} ${JAVASCRIPT} ${DEBUG_UTILS}

DEPS := \
	${DE_PCKGS} \
	${DE_UTILITY_PCKGS} \
	${SOUND_PCKGS} \
	${BASIC_UTILITY_PCKGS} \
	${GENERAL_UTILITY_PCKGS} \
	${PDF_PCKGS} \
	${PRG_PCKGS}

AUR_DEPS := \
	polybar-git \
	${TERM} \
	${BROWSER} \
	${EDITOR} \
	yay

# }}}

print_deps:
	@echo ${DEPS}

print_aur_deps:
	@echo ${AUR_DEPS}

print_all_deps:
	@echo ${DEPS} ${AUR_DEPS}

configs.tar.gz: ${HOME_CONFIGS_ABSOLUTE}
	tar -czvf $@ -C${HOME} ${HOME_CONFIGS}
