#!/bin/sh
IS_PAUSED=$(dunstctl is-paused)

if [ "$IS_PAUSED" = false ]; then
  dunstctl set-paused true
  polybar-msg hook donotdisturb 2
else
  dunstctl set-paused false
  polybar-msg hook donotdisturb 1
fi
