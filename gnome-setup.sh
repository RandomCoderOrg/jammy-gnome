#!/bin/bash

sudo apt-get update

sudo apt-get install -y gnome-shell \
    gnome-shell-* \
    dbus-x11 \
    gnome-terminal \
    gnome-accessibility-themes \
    gnome-calculator \
    gnome-control-center* \
    gnome-desktop3-data \
    gnome-initial-setup \
    gnome-menus \
    gnome-text-editor \
    gnome-themes-extra* \
    gnome-user-docs \
    gnome-video-effects \
    gnome-tweaks \
    gnome-software \
    firefox \
    mesa-utils \
    ubuntu-restricted-extras \
    yaru-*

# load dconf settings
if [ -f /jammy.dconf.conf ]; then
    XDG_RUNTIME_DIR="/tmp" dconf load / < /jammy.dconf.conf || {
        echo -e "\t: dconf load failed.."
    }
fi
