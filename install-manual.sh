#!/bin/bash

run() {
    echo "Running: $@"
    bash "$@"
}

echo "Gnome manual install"
run gnome-setup.sh
run gnome-fixes.sh
run gnome-extra.sh
run gnome-cleanup.sh

cat <<- EOF > "~/x11.sh"
#!/bin/bash
export XDG_CURRENT_DESKTOP=GNOME
export DISPLAY=:0
export XDG_SESSION_TYPE=x11
gnome-shell -x11 
EOF

cat <<- EOF > "~/.vnc/xstartup"
#!/bin/bash
export XDG_CURRENT_DESKTOP=GNOME
export DISPLAY=:0
export XDG_SESSION_TYPE=x11
gnome-shell -x11 &
EOF

chmod +x ~/x11.sh
chmod +x ~/.vnc/xstartup
