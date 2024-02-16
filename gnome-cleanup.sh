#!/bin/bash

# TODO: add more
apt-get remove -y \
    gnome-power-manager \
    gnome-bluetooth

# clean up apt cache
apt-get clean

