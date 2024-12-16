#!/bin/bash
modes="5 minutes\n10 minutes\n20 minutes\n30 minutes\ninfinity"
choice=$(echo -e "$modes" | fuzzel --dmenu --lines 5 -w 20 --config $NIRICONF/fuzzel/fuzzel.ini)
case $choice in
"5 minutes")
  pkill swayidle
  bash $NIRICONF/scripts/swayidle.sh 300 420 1800 &
  disown
  ;;
"10 minutes")
  pkill swayidle
  bash $NIRICONF/scripts/swayidle.sh 600 720 1800 &
  disown
  ;;
"20 minutes")
  pkill swayidle
  bash $NIRICONF/scripts/swayidle.sh 1200 1500 2400 &
  disown
  ;;
"30 minutes")
  pkill swayidle
  bash $NIRICONF/scripts/swayidle.sh 1800 2100 3600 &
  disown
  ;;
"infinity")
  pkill swayidle
  ;;
*)
  echo "unknown option"
  exit 1
  ;;
esac
echo $choice >/tmp/idle-time
