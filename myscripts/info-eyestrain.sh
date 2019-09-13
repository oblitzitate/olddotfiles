
#!/bin/sh

time=$((20 - $(date '+%-M') % 20))

if [ $time -eq 20 ]; then
   notify-send 'Time for a break!' &
   #ogg123 beep.ogg &> /dev/null &
fi

echo "next break in $time min"