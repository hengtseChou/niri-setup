#!/bin/bash
niri msg action do-screen-transition --delay-ms 200
swaylock \
  --clock \
  --screenshots \
  --daemonize \
  --ignore-empty-password \
  --font "Ubuntu Bold" \
  --indicator \
  --indicator-radius 150 \
  --effect-scale 0.4 \
  --effect-vignette 0.2:0.5 \
  --effect-blur 4x2 \
  --datestr "%A, %b %d" \
  --timestr "%k:%M" \
  --key-hl-color b2bcc4ff \
  --ring-color 61768fff \
  --text-color ffffffff \
  --inside-clear-color b2bcc4ff \
  --ring-clear-color b2bcc4ff \
  --text-clear-color 0b0b0cff \
  --inside-ver-color b2bcc4ff \
  --ring-ver-color b2bcc4ff \
  --text-ver-color 0b0b0cff \
  --bs-hl-color c30505ff \
  --inside-wrong-color c30505ff \
  --ring-wrong-color c30505ff \
  --text-wrong-color ffffffff
