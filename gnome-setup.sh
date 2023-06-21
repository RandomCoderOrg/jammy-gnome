#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
export DEBCONF_NONINTERACTIVE_SEEN=true
export LC_ALL=C
export LANGUAGE=C
export LANG=C

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
    language-pack-en-base \
    firefox \
    mesa-utils \
    yaru-*

# load dconf settings
if [ -f /jammy.dconf.conf ]; then
    # export dbus session address
    export $(dbus-launch)

    dconf load / < /jammy.dconf.conf || {
        echo -e "\t: dconf load failed.."
    }
else
    echo -e "\t: dconf file not found.."
fi
