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
#setterm -blank 0 -powersave off -powerdown 0
#xset s off
#xset -dpms

# source Xresources
xrdb -merge ~/.Xresources

# add extra fonts to X
xset +fp /usr/share/fonts/local
xset fp rehash

# load random wallpaper
$HOME/bin/randomWallpaper.sh
# begin running status information
#status-info &
# apply xmodmap for keys
sh -c 'sleep 4s; xmodmap ~/.Xmodmap' &

# set left pointer cursor
xsetroot -cursor_name left_ptr

# for xmonad only, set tray 
#trayer --edge top --align right --SetDocType true --SetPartialStrut true \
#    --expand true --width 10 --transparent true --tint 0x191970 --height 12 &

# set term env var
TERM=xterm-256color
export $TERM

#exec dwm
exec xmonad

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
