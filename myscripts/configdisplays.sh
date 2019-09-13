#!/bin/zsh

EXT="DP-1-1"
INT="eDP-1-1"

# ~/tmp/xrandr-master/xrandr --newmode "3840x2160_120.00"  1498.25  3840 4192 4616 5392  2160 2163 2168 2316 -hsync +vsync
~/tmp/xrandr-master/xrandr --newmode "2560x1440_120.00"  661.25  2560 2784 3064 3568  1440 1443 1448 1545 -hsync +vsync

~/tmp/xrandr-master/xrandr --addmode eDP-1-1 2560x1440_120.00

# ~/tmp/xrandr-master/xrandr --output eDP-1-1 --mode 2560x1440_120.00 --pos 2560x0 --scale-from 2560x1440 --filter nearest --output DP-1-1 --auto --scale 1x1 --filter nearest --pos 0x0

~/tmp/xrandr-master/xrandr --output eDP-1-1 --mode 2560x1440_120.00 --pos 2560x0 --output DP-1-1 --preferred

echo "Configured displays..."

nitrogen --restore
echo "Wallpaper restored..."

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# eDP-1-1
polybar top_left&
polybar top_middle&
polybar top_right&

# DP-1-1
polybar top_left-ext&
polybar top_middle-ext&
polybar top_right-ext&

echo "Polybars launched..."

# Terminate compton
killall -q compton

# Wait until the processes have been shut down
while pgrep -u $UID -x compton >/dev/null; do sleep 1; done

compton&

echo "Compton launched..."
