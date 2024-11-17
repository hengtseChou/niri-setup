#!/bin/bash
if ! command -v paru 2>&1 >/dev/null; then
  echo ":: Error: paru is not installed. Exiting."
  exit 1
fi

apps=(
  alacritty
  fastfetch
  fontconfig
  greetd-tuigreet
  niri
  rofi-wayland
  swaync
  waybar
  wlogout
  zsh
)

utils=(
  brightnessctl
  cliphist
  eza
  figlet
  fzf
  networkmanager
  polkit-gnome
  power-profiles-daemon
  pwvucontrol
  starship  
  swaybg
  swayidle
  swaylock-effects
  udiskie
  xwayland-satellite
  zoxide
)

fonts=(
  noto-fonts-cjk
  noto-fonts-emoji
  ttf-jetbrains-mono-nerd
  ttf-ubuntu-font-family
  ttf-ubuntu-mono-nerd
)

theming=(
  adwaita-cursors
  gnome-themes-extra
  gtk3
  gtk4
  gtk-engine-murrine
  sassc
)

clear
echo ":: Installing apps..."
paru -S --needed "${apps[@]}"
echo -e "\n:: Done. Proceeding to the next step..."
time sleep 3

clear
echo ":: Installing utilies..."
paru -S --needed "${utils[@]}"
echo -e "\n:: Done. Proceeding to the next step..."
time sleep 3

clear
echo ":: Installing fonts..."
paru -S --needed "${fonts[@]}"
echo -e "\n:: Done. Proceeding to the next step..."
time sleep 3

clear
read -p ":: Skip theming? (y/N): " skip_theming
skip_theming=${skip_theming:-N}
if [[ "$skip_theming" =~ ^([yY])$ ]]; then
  echo ":: Skipping theme installation."
  echo ":: Proceeding to the next step..."
  time sleep 3
else
  echo ":: Installing theme..."
  paru -S --needed "${theming[@]}"
  git clone https://github.com/vinceliuice/Colloid-gtk-theme.git
  cd Colloid-gtk-theme
  ./install.sh
  cd ..
  git clone https://github.com/vinceliuice/Colloid-icon-theme.git
  cd Colloid-icon-theme
  ./install.sh
  cd ..
  gsettings set org.gnome.desktop.interface gtk-theme 'Colloid'
  gsettings set org.gnome.desktop.interface icon-theme 'Colloid'
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
  gsettings set org.gnome.desktop.interface cursor-size 24
  gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita'
  echo -e "\n:: Done. Proceeding to the next step..."
  time sleep 3
fi

clear
chsh -s /bin/zsh

sudo systemctl enable greetd.service
sudo cp ./greetd/config.toml /etc/greetd/config.toml
echo ":: Copied $PWD/greetd/config.toml to /etc/greetd/config.toml"

./symlink.sh $PWD/alacritty --to-config
./symlink.sh $PWD/niri --to-config
./symlink.sh $PWD/starship/starship.toml --to-config
./symlink.sh $PWD/swaync --to-config
./symlink.sh $PWD/zsh --to-config
./symlink.sh $PWD/zsh/.zshrc --to-home

echo ":: Setting up fontconfig..."
fc-cache -f
gsettings set org.gnome.desktop.interface font-name 'Ubuntu 12'
gsettings set org.gnome.desktop.interface monospace-font-name 'JetBrainsMono Nerd Font 12'

echo ""
echo ":: Niri configuration completed. "
echo ":: Please reboot your system."
