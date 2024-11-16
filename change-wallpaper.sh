#!/bin/bash
if [ $# -eq 0 ]; then
    echo "Usage: $0 <file_path>"
    exit 1
fi

file_path="$1"
filename=$(basename -- "$file_path")
extension="${filename##*.}"

# Check if the file exists
if [ ! -e "$file_path" ]; then
    echo "Error: file '$file_path' does not exist"
    exit 1
fi

# Check if the file format is supported
supported_formats=("jpeg" "png" "gif" "pnm" "tga" "tiff" "webp" "bmp" "farbfeld" "jpg")
if [[ ! " ${supported_formats[@]} " =~ " $extension " ]]; then
    echo "Error: file format '$extension' is not supported"
    exit 1
fi

wallpaper_dir="$HOME/Niri/wallpapers"
current_wallpaper="$wallpaper_dir/current_wallpaper.$extension"

# remove old wallpaper
rm "$wallpaper_dir/current_wallpaper."*
cp -f "$file_path" "$wallpaper_dir/$filename"
cp -f "$wallpaper_dir/$filename" "$current_wallpaper"
echo ":: Copied $PWD/$file_path to $wallpaper_dir."
echo ":: Setting up swaybg"
pkill swaybg
swaybg -i $(find $HOME/Niri/wallpapers -type f -name 'current_wallpaper.*') &>/dev/null &
disown
echo ":: Done."
