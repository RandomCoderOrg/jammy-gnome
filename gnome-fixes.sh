#!/bin/bash

# disable org.freedesktop.login1 for gdm
# issue: login1 depends on systemd which wont work in proot & chroot
#        gnome-shell triggers login1 and fails to start cause it returns exit code 1
# solution: removing login1 files from entire filesystem or moving it to a different location should work
#           but it is not recommended to remove login1 files from entire filesystem

for file in $(find /usr -type f -iname "*login1*"); do 
    mv -v $file "$file.back"
done

# disable org.freedesktop.login1 for gdm

