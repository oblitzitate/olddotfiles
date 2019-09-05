#!/bin/bash

#(/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1)&
#echo "Started polkit-gnome-authentication-agent-1"

#(/usr/lib/geoclue-2.0/demos/agent)&
#echo "Started geoclue agent"

(sh -c "/usr/bin/nvidia-settings --load-config-only")&
echo "Loaded nvidia settings"

(/usr/bin/gnome-software --gapplication-service)&
echo "Started gapplication-service"

start-pulseaudio-x11&
echo "Started pulseaudio"

(nitrogen --restore)&
echo "Restored wallaper"

compton &
echo "Started compton"

redshift &
echo "Started redshift"

(polybar main)&
(polybar workspaces)&
(polybar status)&
echo "Started polybar"