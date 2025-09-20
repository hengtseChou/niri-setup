#!/bin/bash
wallpaper_dir="$HOME/Pictures/Wallpapers"
export GUM_CHOOSE_HEADER_FOREGROUND="#d8dadd"
export GUM_CHOOSE_SELECTED_FOREGROUND="#758A9B"
export GUM_CHOOSE_CURSOR_FOREGROUND="#758A9B"

if [ ! -d "$wallpaper_dir" ]; then
  mkdir -p "$wallpaper_dir"
fi
images=$(fd . --base-directory "$wallpaper_dir" -x file {} | grep -oP '^.+: \w+ image' | cut -d ':' -f 1 | sort)
if [ -z "$images" ]; then
  echo "[ERROR] no image file found. place your wallpapers in $wallpaper_dir."
  exit 1
fi
image="$wallpaper_dir/$(echo "$images" | gum choose --header 'choose your wallpaper: ')"
if [ $? -eq 1 ]; then
  exit 1
fi
mode=$(echo -e "stretch\nfill\nfit\ncenter\ntile" | gum choose --header "choose wallpaper mode: ")
if [ $? -eq 1 ]; then
  exit 1
fi

echo "[INFO] New wallpaper: $image"
echo "[INFO] copying new wallpaper to $NIRICONF..."
cp -f $image "$NIRICONF/wallpapers/workspace.${image##*.}"
canvas_color=$(magick $NIRICONF/wallpapers/workspace.${image##*.} -crop x1+0+0 -resize 1x1 txt:- | grep -o '#[0-9A-Fa-f]\{6\}')
workspace_cmd="swaybg -i $NIRICONF/wallpapers/workspace.${image##*.} -m $mode -c '$canvas_color'"
sed -i "s|^spawn-sh-at-startup \"swaybg.*|spawn-sh-at-startup \"$workspace_cmd\"|" "$NIRICONF/niri/config.kdl"
pkill swaybg
nohup sh -c "$workspace_cmd" >/dev/null 2>&1 &

echo "[INFO] creating new overview backdrop..."
magick "$NIRICONF/wallpapers/workspace.${image##*.}" -scale 10% -blur 0x2.5 -resize 1000% "$NIRICONF/wallpapers/backdrop.${image##*.}"
backdrop_cmd="swww-daemon \& swww img $NIRICONF/wallpapers/backdrop.${image##*.}"
swww img "$NIRICONF/wallpapers/backdrop.${image##*.}"
sed -i "s|^spawn-sh-at-startup \"swww.*img.*|spawn-sh-at-startup \"$backdrop_cmd\"|" "$NIRICONF/niri/config.kdl"

echo "[INFO] done!"
sleep 2
