#!/bin/bash

export GUM_CHOOSE_HEADER_FOREGROUND="$#d8dadd"
export GUM_CHOOSE_SELECTED_FOREGROUND="#758A9B"
export GUM_CHOOSE_CURSOR_FOREGROUND="#758A9B"

is_installed() {
  pacman -Qi "$1" &>/dev/null
}

if ! is_installed gum; then
  echo "[Error] missing dependency: gum"
  exit 1
fi

symlink() {
  source="$1"
  shift
  PARSED=$(getopt -o '' --long to-home,to-config,custom-dir: -- "$@")
  if [[ $? -ne 0 ]]; then
    return 1
  fi
  eval set -- "$PARSED"

  target_dir=""
  while true; do
    case "$1" in
    --to-home)
      target_dir="$HOME"
      shift
      ;;
    --to-config)
      target_dir="$HOME/.config"
      shift
      ;;
    --custom-dir)
      target_dir="$2"
      mkdir -p $target_dir
      shift 2
      ;;
    --)
      shift # End of options
      break
      ;;
    *)
      echo "[Error] Invalid option: $1" >&2
      return 1
      ;;
    esac
  done

  # If no valid options were provided (target_dir is empty), show an error and exit
  if [ -z "$target_dir" ]; then
    echo "[Error] target dir $target_dir is empty"
    return 1
  fi

  target="$target_dir/$(basename $source)"

  if [ -L "${target}" ]; then
    # is a symlink
    rm ${target}
    ln -s ${source} ${target}
  elif [ -d ${target} ]; then
    # is a dir
    rm -rf ${target}/
    ln -s ${source} ${target}
  elif [ -f ${target} ]; then
    # is a file
    rm ${target}
    ln -s ${source} ${target}
  else
    ln -s ${source} ${target}
  fi
}

helper_options=(
  paru
  yay
  aura
  trizen
)
available_helpers=()
for helper in "${helper_options[@]}"; do
  if is_installed "$helper"; then
    available_helpers+=("$helper")
  fi
done
if [ ${#available_helpers[@]} -eq 0 ]; then
  echo "[Error] no AUR helper available. please install one of {yay, paru, aura, trizen}."
  exit 1
fi
aur=$(gum choose "${available_helpers[@]}" --header "Choose an AUR helper:" --select-if-one)

pkgs=(
  alacritty
  blueman
  brightnessctl
  cliphist
  fuzzel
  niri
  pamixer
  polkit-gnome
  pwvucontrol
  swaybg
  swayidle
  swaylock-effects
  swaync
  udiskie
  waybar
  wlogout
  xwayland-satellite
)
$aur -Syu --needed $(echo "${pkgs[*]}")

config_folder=$(dirname "$(realpath "$0")")
symlink $config_folder/niri --to-config

sed -i "s|\$NIRICONF|$config_folder|g" $(realpath "$config_folder/niri/config.kdl")
sed -i "s|\$NIRICONF|$config_folder|g" $(realpath "$config_folder/scripts/power-profiles.sh")
sed -i "s|\$NIRICONF|$config_folder|g" $(realpath "$config_folder/scripts/swayidle.sh")
sed -i "s|\$NIRICONF|$config_folder|g" $(realpath "$config_folder/scripts/toggle-swayidle.sh")
sed -i "s|\$NIRICONF|$config_folder|g" $(realpath "$config_folder/scripts/toggle-waybar.sh")
sed -i "s|\$NIRICONF|$config_folder|g" $(realpath "$config_folder/scripts/wlogout.sh")
sed -i "s|\$NIRICONF|$config_folder|g" $(realpath "$config_folder/waybar/config")
sed -i "s|\$NIRICONF|$config_folder|g" $(realpath "$config_folder/waybar/modules.jsonc")

if niri validate >/dev/null; then
  echo "[INFO] niri setup all completed"
else
  echo "[ERROR] Something went wrong. See the following output:"
  niri validate
fi