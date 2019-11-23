#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar bar1 >>/tmp/polybarbase.log 2>&1 &

for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar bar2 >>/tmp/polybar$m.log 2>&1 &
done

echo "Bars launched..."
