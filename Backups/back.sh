#!/bin/bash

cd && tar czf cfg_backup_void.tar.gz \
    .config/dunst \
    .config/suckless/* \
    .config/nvim \
    .config/picom \
    .xinitrc \
    .aliasrc \
    .bash_profile \
    .bashrc \
    .zshrc \
    .tmux \
    .tmux.conf \
    Pictures/Wallpapers/zdanie_minimalizm_chb_132403_1920x1080.jpg \
    Pictures/Wallpapers/sea.jpg \
    /etc/doas.conf \
    /etc/X11/xorg.conf.d/* \
    /usr/share/xsessions/dwm.desktop \
    && mv cfg_backup_void.tar.gz Backups && cd -


    # /etc/pacman.d/mirrorlist_sorted.backup \
    
    # .xinitrc \
    # /etc/doas.conf \
    # /etc/pacman.conf \
    # /etc/pacman.d/mirrorlist \
    # /etc/pacman.d/mirrorlist_sorted.backup \
    # /etc/X11/xorg.conf.d/* \
