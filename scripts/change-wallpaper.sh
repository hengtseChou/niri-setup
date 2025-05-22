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
  notify-send --urgency=critical "change-wallpaper.sh" "No image file found. Place your wallpapers in $wallpaper_dir."
  echo "[ERROR] No image file found. Place your wallpapers in $wallpaper_dir."
  exit 1
fi
image="$wallpaper_dir/$(echo "$images" | gum choose --header 'Choose your wallpaper: ')"
mode=$(echo -e "stretch\nfill\nfit\ncenter\ntile" | gum choose --header "Choose wallpaper mode: ")

echo "[INFO] Copying selected wallpaper to $NIRICONF..."
cp $image "$NIRICONF/wallpapers/workspace.${image##*.}"
canvas_color=$(magick $NIRICONF/wallpapers/workspace.${image##*.} -crop x1+0+0 -resize 1x1 txt:- | grep -o '#[0-9A-Fa-f]\{6\}')
workspace_cmd="\"swaybg\" \"-i\" \"$NIRICONF/wallpapers/workspace.${image##*.}\" \"-m\" \"$mode\" \"-c\" \"$canvas_color\""
sed -i "s|^spawn-at-startup \"swaybg.*|spawn-at-startup $new_cmd|" "$NIRICONF/niri/config.kdl"
pkill swaybg
(eval "$workspace_cmd" &>/dev/null &)

echo "[INFO] Creating new overview backdrop..."
magick "$NIRICONF/wallpapers/workspace.${image##*.}" -blur 0x8 "$NIRICONF/wallpapers/backdrop.${image##*.}"
backdrop_cmd="\"swww\" \"img\" \"$NIRICONF/images/backdrop.${image##*.}\""
swww img "$NIRICONF/wallpapers/backdrop.${image##*.}"
sed -i "s|^spawn-at-startup \"swww.*|spawn-at-startup $backdrop_cmd|" "$NIRICONF/niri/config.kdl"

echo "[INFO] Done!"
