#!/bin/bash

# TODO: add more
apt remove -y \
    gnome-power-manager \
    gnome-bluetooth*

# clean up apt cache
apt-get clean

