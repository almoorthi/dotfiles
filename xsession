#!/bin/sh

systemctl --user daemon-reload
systemctl --user start poller
systemctl --user start sound

nm-applet &
dropbox start &
xautolock -time 5 -locker lock-now &
eval `gnome-keyring-daemon`
eval `ssh-agent`
eval `gpg-agent --daemon -s --default-cache-ttl 28800 --max-cache-ttl 86400`
taffybar &
xmodmap "$HOME/.xmodmap"
keepassxc &
sv-run-offlineimap &
scenery &
armstrong &
postqueue-checker &
shutter --min_at_startup &

exec xmonad
