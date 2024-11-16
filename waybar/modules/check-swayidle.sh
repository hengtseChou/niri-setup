#!/bin/bash
swayidle=$(pgrep -x swayidle)
if [ -z $swayidle ]; then
  printf '{"text": "", "alt": "deactivated", "tooltip": "deactivated", "class": "deactivated"}'
else
  printf '{"text": "", "alt": "activated", "tooltip": "activated", "class": "activated"}'
fi
