#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# prevent X from sleeping the monitor
setterm -blank 0 -powersave off -powerdown 0
xset s off
xset -dpms

# add extra fonts to X
xset +fp /usr/share/fonts/local
xset fp rehash

randomWallpaper.sh
status-info &
xmodmap ~/.Xmodmap

exec dwm

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
