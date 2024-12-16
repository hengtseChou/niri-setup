#!/bin/bash
niri msg action do-screen-transition --delay-ms 300
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
  --key-hl-color 61768ff2 \
  --ring-color 61768ff2 \
  --text-color ffffffe6 \
  --inside-clear-color 0b0b0cf2 \
  --ring-clear-color 61768ff2 \
  --text-clear-color ffffffe6 \
  --inside-ver-color 0b0b0cf2 \
  --ring-ver-color 61768ff2 \
  --text-ver-color ffffffe6 \
  --bs-hl-color 3c3836ff \
  --inside-wrong-color c30505ff \
  --ring-wrong-color c30505ff \
  --text-wrong-color ffffffff
