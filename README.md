- **Window Manager •** [Niri](https://github.com/YaLTeR/niri)
- **Display Manager •** [tuigreet](https://github.com/apognu/tuigreet)
- **Launcher •** [rofi-wayland](https://github.com/lbonn/rofi)
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

![screenshot1](https://i.imgur.com/A777YBM.png)

![screenshot2](https://i.imgur.com/YIpm35s.png)

![screenshot3](https://i.imgur.com/7ffEhLz.png)

# Installation

```
git clone https://github.com/hengtseChou/Niri.git
cd Niri
./setup.sh
```

The script will install packages required for this setup and symlink to the corresponding directories. Some apps as seen in alias from `.zshrc` or keybindings from `niri/config.kdl` may consider optional and therefore not be included.

# Keybinds

<div align="center">

| Keys                                                   | Action                                                              |
| :----------------------------------------------------- | :------------------------------------------------------------------ |
| <kbd>Super</kbd> + <kbd>Enter</kbd>                    | Open terminal                                                       |
| <kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>Enter</kbd>  | Open launcher                                                       |
| <kbd>Super</kbd> + <kbd>B</kbd>                        | Open Firefox                                                        |
| <kbd>Super</kbd> + <kbd>E</kbd>                        | Open Nautilus                                                       |
| <kbd>Super</kbd> + <kbd>N</kbd>                        | Toggle notification center                                          |
| <kbd>Super</kbd> + <kbd>L</kbd>                        | Launch lock screen                                                  |
| <kbd>Super</kbd> + <kbd>C</kbd>                        | Launch clipboard manager                                            |
| <kbd>Super</kbd> + <kbd>L</kbd>                        | Launch lock screen                                                  |
| <kbd>Super</kbd> + <kbd>Backspace</kbd>                | Launch logout screen                                                |
| <kbd>XF86MonBrightnessUp</kbd>                         | Increase brightness by 10%                                          |
| <kbd>XF86MonBrightnessDown</kbd>                       | Decrease brightness by 10%                                          |
| <kbd>XF86AudioRaiseVolume</kbd>                        | Raise volume by 10%                                                 |
| <kbd>XF86AudioLowerVolume</kbd>                        | Lower volume by 10%                                                 |
| <kbd>XF86AudioMute</kbd>                               | Toggle mute                                                         |
| <kbd>XF86AudioPlay</kbd>                               | Play or pause media                                                 |
| <kbd>XF86AudioNext</kbd>                               | Next media track                                                    |
| <kbd>XF86AudioPrev</kbd>                               | Previous media track                                                |
| <kbd>Super</kbd> + <kbd>Q</kbd>                        | Close window                                                        |
| <kbd>Super</kbd> + <kbd>W</kbd>                        | Switch preset column width                                          |
| <kbd>Super</kbd> + <kbd>H</kbd>                        | Switch preset window height                                         |
| <kbd>Super</kbd> + <kbd>M</kbd>                        | Toggle maximize mode                                                |
| <kbd>Super</kbd> + <kbd>F</kbd>                        | Toggle fullscreen mode                                              |
| <kbd>Super</kbd> + <kbd>Left</kbd>                     | Move column to the left                                             |
| <kbd>Super</kbd> + <kbd>Right</kbd>                    | Move column to the right                                            |
| <kbd>Super</kbd> + <kbd>Up</kbd>                       | Move column upward                                                  |
| <kbd>Super</kbd> + <kbd>Down</kbd>                     | Move column downward                                                |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>Left</kbd>  | Resize column width by -10%                                         |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>Right</kbd> | Resize column width by +10%                                         |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>Up</kbd>    | Resize window height by +10%                                        |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>Down</kbd>  | Resize window height by -10%                                        |
| <kbd>Super</kbd> + <kbd>Home</kbd>                     | Focus the first column                                              |
| <kbd>Super</kbd> + <kbd>End</kbd>                      | Focus the last column                                               |
| <kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>Home</kbd>   | Move column to the first                                            |
| <kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>End</kbd>    | Move column to the last                                             |
| <kbd>Super</kbd> + <kbd>BracketLeft</kbd>              | Consume from/expel to the column on the left                        |
| <kbd>Super</kbd> + <kbd>BracketRight</kbd>             | Consume from/expel to the column on the right                       |
| <kbd>Super</kbd> + <kbd>Comma</kbd>                    | Consume window from the right into the bottom of the focused column |
| <kbd>Super</kbd> + <kbd>Period</kbd>                   | Expel the bottom window from the focused column to the right        |
| <kbd>Super</kbd> + <kbd>[0-9]</kbd>                    | Move column to workspace [1-10]                                     |
| <kbd>Print</kbd>                                       | Screenshot (region)                                                 |
| <kbd>Ctrl</kbd> + <kbd>Print</kbd>                     | Screenshot (window)                                                 |
| <kbd>Shift</kbd> + <kbd>Print</kbd>                    | Screenshot (monitor)                                                |

</div>
