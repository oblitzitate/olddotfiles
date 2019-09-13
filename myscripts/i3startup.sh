#!/bin/zsh

(sh -c "/usr/bin/nvidia-settings --load-config-only")&
echo "Loaded nvidia settings"

(/usr/bin/gnome-software --gapplication-service)&
echo "Started gapplication-service"

start-pulseaudio-x11&
echo "Started pulseaudio"

redshift&
echo "Started redshift"

~/myscripts/spotify/launchlistener.sh&