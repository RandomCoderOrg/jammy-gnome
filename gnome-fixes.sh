#!/bin/bash

# disable org.freedesktop.login1 for gdm
# issue: login1 depends on systemd which wont work in proot & chroot
#        gnome-shell triggers login1 and fails to start cause it returns exit code 1
# solution: removing login1 files from entire filesystem or moving it to a different location should work
#           but it is not recommended to remove login1 files from entire filesystem

for file in $(find /usr -type f -iname "*login1*"); do 
    mv -v $file "$file.back"
done

# fix issue with set-uid helper permission
# issue: gnome-shell fails to start cause it can't execute set-uid helper
# solution: set permissions u+s for set-uid helper on every bashrc execution

echo "# fix issue with set-uid helper permission" >> ~/.bashrc
echo "sudo chmod u+s /usr/lib/dbus-1.0/dbus-daemon-launch-helper" >> ~/.bashrc
