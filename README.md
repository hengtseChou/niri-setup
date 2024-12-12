- **Window Manager •** [Niri](https://github.com/YaLTeR/niri)
- **Display Manager •** [tuigreet](https://github.com/apognu/tuigreet)
- **Launcher •** [Fuzzel](https://codeberg.org/dnkl/fuzzel)
- **Panel •** [Waybar](https://github.com/Alexays/Waybar)
- **Panel Font •** [Ubuntu Mono Nerd Font](https://archlinux.org/packages/extra/any/ttf-ubuntu-mono-nerd/) + [Noto Sans Mono CJK TC](https://archlinux.org/packages/extra/any/noto-fonts-cjk/)
- **Notification •** [SwayNC](https://github.com/ErikReider/SwayNotificationCenter)
- **Clipboard Manager •** [cliphist](https://github.com/sentriz/cliphist)
- **Wallpaper Engine •** [swaybg](https://github.com/swaywm/swaybg)
- **Idle Daemon •** [swayidle](https://github.com/swaywm/swayidle)
- **Lock Screen •** [swaylock](https://github.com/swaywm/swaylock)
- **Logout Menu •** [wlogout](https://github.com/ArtsyMacaw/wlogout)
- **Fonts •** [Ubuntu](https://archlinux.org/packages/extra/any/ttf-ubuntu-font-family/) + [Noto Sans/Serif CJK TC](https://archlinux.org/packages/extra/any/noto-fonts-cjk/)
- **Theme •** [Colloid-gtk-theme](https://github.com/vinceliuice/Colloid-gtk-theme)
- **Icons •** [Colloid-icon-theme](https://github.com/vinceliuice/Colloid-icon-theme)
- **Terminal •** [Alacritty](https://github.com/alacritty/alacritty)
- **Terminal Font •** [JetBrains Mono Nerd Font](https://archlinux.org/packages/extra/any/ttf-jetbrains-mono-nerd/)
- **Shell •** [zsh](https://www.zsh.org/) + [zinit](https://github.com/zdharma-continuum/zinit) + [starship](https://github.com/starship/starship)

# Screenshots

![screenshot1](https://i.imgur.com/GFD5VfH.png)

![screenshot2](https://i.imgur.com/kVWkPyy.png)

![screenshot3](https://i.imgur.com/dNIMi1d.png)

![screenshot4](https://i.imgur.com/9GLaLjH.png)

# Installation

```
git clone https://github.com/hengtseChou/Niri.git
cd Niri
./setup.sh
```

The script will install packages required for this setup and symlink to the corresponding directories. Make sure you have one of the AUR helpers installed.

For the dotfiles of `tuigreet` and `zsh`, please refer to [my main configuration repo](https://github.com/hengtseChou/Conf).

# Keybindings

## Applications

| Keys                                                  | Action                     |
| :---------------------------------------------------- | :------------------------- |
| <kbd>Super</kbd> + <kbd>Enter</kbd>                   | Open terminal              |
| <kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>Enter</kbd> | Open launcher              |
| <kbd>Super</kbd> + <kbd>B</kbd>                       | Open firefox               |
| <kbd>Super</kbd> + <kbd>E</kbd>                       | Open nautilus              |
| <kbd>Super</kbd> + <kbd>N</kbd>                       | Toggle notification center |
| <kbd>Super</kbd> + <kbd>L</kbd>                       | Launch lock screen         |
| <kbd>Super</kbd> + <kbd>C</kbd>                       | Launch clipboard menu      |
| <kbd>Super</kbd> + <kbd>I</kbd>                       | Toggle idle daemon         |
| <kbd>Super</kbd> + <kbd>P</kbd>                       | Launch power profile menu  |
| <kbd>Super</kbd> + <kbd>U</kbd>                       | Launch updater             |
| <kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>W</kbd>     | Toggle waybar              |
| <kbd>Super</kbd> + <kbd>Backspace</kbd>               | Launch logout screen       |

## Backlight and Audio

| Keys                             | Action                     |
| :------------------------------- | :------------------------- |
| <kbd>XF86MonBrightnessUp</kbd>   | Increase brightness by 10% |
| <kbd>XF86MonBrightnessDown</kbd> | Decrease brightness by 10% |
| <kbd>XF86AudioRaiseVolume</kbd>  | Raise volume by 10%        |
| <kbd>XF86AudioLowerVolume</kbd>  | Lower volume by 10%        |
| <kbd>XF86AudioMute</kbd>         | Toggle mute                |
| <kbd>XF86AudioPlay</kbd>         | Play or pause media        |
| <kbd>XF86AudioNext</kbd>         | Next media track           |
| <kbd>XF86AudioPrev</kbd>         | Previous media track       |

## Windows and Columns

| Keys                                                   | Action                                                                   |
| :----------------------------------------------------- | :----------------------------------------------------------------------- |
| <kbd>Super</kbd> + <kbd>Q</kbd>                        | Close window                                                             |
| <kbd>Super</kbd> + <kbd>W</kbd>                        | Switch preset column width                                               |
| <kbd>Super</kbd> + <kbd>H</kbd>                        | Switch preset window height                                              |
| <kbd>Super</kbd> + <kbd>M</kbd>                        | Toggle maximize mode                                                     |
| <kbd>Super</kbd> + <kbd>F</kbd>                        | Toggle fullscreen mode                                                   |
| <kbd>Super</kbd>+ <kbd>Left</kbd>                      | Focus column on the left                                                 |
| <kbd>Super</kbd>+ <kbd>Right</kbd>                     | Focus column on the right                                                |
| <kbd>Super</kbd>+ <kbd>Down</kbd>                      | Focus window downward                                                    |
| <kbd>Super</kbd>+ <kbd>Up</kbd>                        | Focus window upward                                                      |
| <kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>Left</kbd>   | Move column to the left                                                  |
| <kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>Right</kbd>  | Move column to the right                                                 |
| <kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>Down</kbd>   | Move window downward                                                     |
| <kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>Up</kbd>     | Move window upward                                                       |
| <kbd>Super</kbd> + <kbd>Home</kbd>                     | Focus the first column                                                   |
| <kbd>Super</kbd> + <kbd>End</kbd>                      | Focus the last column                                                    |
| <kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>Home</kbd>   | Move column to the first                                                 |
| <kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>End</kbd>    | Move column to the last                                                  |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>Left</kbd>  | Resize column width by -10%                                              |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>Right</kbd> | Resize column width by +10%                                              |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>Down</kbd>  | Resize window height by -10%                                             |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>Up</kbd>    | Resize window height by +10%                                             |
| <kbd>Super</kbd> + <kbd>BracketLeft</kbd>              | Consume from/expel to the column on the left                             |
| <kbd>Super</kbd> + <kbd>BracketRight</kbd>             | Consume from/expel to the column on the right                            |
| <kbd>Super</kbd> + <kbd>Comma</kbd>                    | Consume window from the right </br>into the bottom of the focused column |
| <kbd>Super</kbd> + <kbd>Period</kbd>                   | Expel the bottom window from </br>the focused column to the right        |

## Workspaces

| Keys                                                     | Action                          |
| :------------------------------------------------------- | :------------------------------ |
| <kbd>Super</kbd> + <kbd>PageDown</kbd>                   | Focus workspace downward        |
| <kbd>Super</kbd> + <kbd>PageUp</kbd>                     | Focus workspace upward          |
| <kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>PageDown</kbd> | Move column downward            |
| <kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>PageUp</kbd>   | Move column upward              |
| <kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>[0-9]</kbd>    | Move column to workspace [1-10] |

## Screenshot

| Keys                                | Action               |
| :---------------------------------- | :------------------- |
| <kbd>Print</kbd>                    | Screenshot (region)  |
| <kbd>Ctrl</kbd> + <kbd>Print</kbd>  | Screenshot (window)  |
| <kbd>Shift</kbd> + <kbd>Print</kbd> | Screenshot (monitor) |
