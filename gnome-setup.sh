#!/bin/bash

sudo apt-get install -y gnome-shell \
    gnome-shell-* \
    dbus-x11 \
    gnome-terminal \
    gnome-accessibility-themes \
    gnome-calculator \
    gnome-control-center* \
    gnome-desktop3-data \
    gnome-initial-setup \
    gnome-logs \
    gnome-menus \
    gnome-online-accounts \
    gnome-text-editor \
    gnome-themes-extra* \
    gnome-user-docs \
    gnome-video-effects \
    gnome-tweaks \
    firefox \
    mesa-utils \
    ubuntu-restricted-extras \
    yaru-*

# load dconf settings
if [ -f /jammy.dconf.conf ]; then
    dconf load / < /jammy.dconf.conf
fi
