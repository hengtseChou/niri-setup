#!/bin/bash
mode="$(cat $HOME/.local/state/idle-time)"
case $mode in
"5 minutes")
  printf '{"text": " 5m", "alt": "swayidle enabled", "tooltip": "swayidle enabled"}'
  ;;
"10 minutes")
  printf '{"text": " 10m", "alt": "swayidle enabled", "tooltip": "swayidle enabled"}'
  ;;
"20 minutes")
  printf '{"text": " 20m", "alt": "swayidle enabled", "tooltip": "swayidle enabled"}'
  ;;
"30 minutes")
  printf '{"text": " 30m", "alt": "swayidle enabled", "tooltip": "swayidle enabled"}'
  ;;
"infinity")
  printf '{"text": " inf", "alt": "swayidle disabled", "tooltip": "swayidle disabled"}'
  ;;
*)
  printf '{"text": " err", "alt": "idle-time not found", "tooltip": "idle-time not found"}'
  ;;
esac
