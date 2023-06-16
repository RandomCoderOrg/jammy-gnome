#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
export DEBCONF_NONINTERACTIVE_SEEN=true
export LC_ALL=C
export LANGUAGE=C
export LANG=C

install_firefox() {
    # trigger normal installation to resolve all dependencies (fonts)
    apt-get install -y firefox
    
    # remove firefox snap and install firefox from ppa for debian package
    rm -rf /etc/apt/preferences.d/fire*
    apt remove firefox* -y
    apt update && apt install firefox software-properties-common -y
    add-apt-repository --yes ppa:mozillateam/ppa
    
echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
' | sudo tee /etc/apt/preferences.d/mozilla-firefox
    echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox

    apt remove firefox -y
    apt install firefox -y
}

install_firefox
