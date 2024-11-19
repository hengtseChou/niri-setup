#!/bin/bash
output=$(niri msg outputs)
if echo "$output" | grep -q "Disabled"; then
    niri msg output eDP-1 on
else
    niri msg output eDP-1 off
fi