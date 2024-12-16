#!/bin/bash
echo ""
figlet "Updates" -f slant -w 44 -c
echo ""
sleep 0.1

paru

notify-send "Update complete"
echo
echo ":: Update complete"
sleep 2
