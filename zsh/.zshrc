#             _
#     _______| |__  _ __ ___
#    |_  / __| '_ \| '__/ __|
#   _ / /\__ \ | | | | | (__
#  (_)___|___/_| |_|_|  \___|

# ---------------------------------------------------------------------------- #
#                                     PATH                                     #
# ---------------------------------------------------------------------------- #

export PATH="/usr/lib/ccache/bin/:$PATH"
export PATH="$HOME/Scripts:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.go/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.spicetify:$PATH"

# ---------------------------------------------------------------------------- #
#                                     ZINIT                                    #
# ---------------------------------------------------------------------------- #

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit ice as"command" from"gh-r" \
  atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
  atpull"%atclone" src"init.zsh"
zinit light starship/starship

# Add in snippets
zinit snippet OMZP::sudo

# Load completions
autoload -U compinit && compinit
zinit cdreplay -q

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --icons --group-directories-first $realpath'
export FZF_CTRL_R_OPTS="--layout=reverse"

bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char

# ---------------------------------------------------------------------------- #
#                                      GIT                                     #
# ---------------------------------------------------------------------------- #

alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gb="git branch"
alias gsw="git switch"
alias gd="git diff"
alias gcl="git clone"

# ---------------------------------------------------------------------------- #
#                                   SHORTCUTS                                  #
# ---------------------------------------------------------------------------- #

alias e="exit"
alias g="gnome-text-editor"
alias ls="eza --icons --group-directories-first"
alias ll="eza -l --icons --group-directories-first"
alias lt="eza --tree --level=1 --icons --group-directories-first"
alias clock="peaclock"
alias zshrc="nano $HOME/.zshrc"
alias reload="source $HOME/.zshrc"

# ---------------------------------------------------------------------------- #
#                               UTILITY FUNCTIONS                              #
# ---------------------------------------------------------------------------- #

ff() {
  fastfetch --config $HOME/Niri/fastfetch/niri.jsonc
}

log-out() {
  echo "Session found: Niri. Logging out..."
  sleep 2
  pkill niri
}

change-wallpaper() {

  wallpaper_dir="$HOME/Pictures/Wallpapers"
  if [ ! -d $wallpaper_dir ]; then
    echo "Error: ~/Pictures/Wallpapers does not exist. Place images into this directory."
    exit 1
  fi
  deps=(magick gum)
  for dep in ${deps[@]}; do
    if ! command -v $dep 2>&1 >/dev/null; then
      echo ":: Error: $dep is not installed."
      exit 1
    fi
  done

  images=$(fd . --base-directory $wallpaper_dir -e jpg -e jpeg -e png -e gif -e bmp -e tiff -e tif -e webp -e ico -e jif -e psd -e dds -e heif -e heic)
  if [ -z "$images" ]; then
    echo "Error: No image file found in ~/Pictures/Wallpapers."
    exit 1
  fi
  image="$wallpaper_dir/$(echo "$images" | gum choose --header 'Choose from ~/Pictures/Wallpapers: ')"
  image_name=$(basename -- "$image")
  extension="${image_name##*.}"

  mode=$(echo "stretch\nfill\nfit\ncenter\ntile" | gum choose --header "Select wallpaper mode: ")
  new_cmd="swaybg -i $image -m $mode -c 000000"
  niri_config="$HOME/Niri/niri/config.kdl"
  if ! grep -q "spawn-at-startup \"sh\" \"-c\" \"swaybg" "$niri_config"; then
    sed -i "/\/\/ startup processes/a spawn-at-startup \"sh\" \"-c\" \"$new_cmd\"" "$niri_config"
  else
    sed -i "s|^spawn-at-startup \"sh\" \"-c\" \"swaybg.*|spawn-at-startup \"sh\" \"-c\" \"$new_cmd\"|" "$niri_config"
  fi
  echo "Selected: $(basename $image)"
  echo "Mode: $mode"
  pkill swaybg
  (eval $new_cmd &>/dev/null &)
  echo "OK!"
}

xs() {
  if ! pgrep -x "xwayland-satell" >/dev/null; then
    read -p "xwayland-satellite is not running. Do you want to start it? (Y/n): " response
    response=${response:-Y}
    if [[ "$response" =~ ^[Yy]$ ]]; then
      nohup xwayland-satellite >/dev/null 2>&1 &
      echo "xwayland-satellite started."
    else
      echo "Exiting."
      exit 1
    fi
  fi
  env DISPLAY=:0 $1
}

# ---------------------------------------------------------------------------- #
#                                    PACMAN                                    #
# ---------------------------------------------------------------------------- #

alias inst="paru -S"
alias uninst="paru -Rns"
alias up="paru -Syu"
alias mirrors="rate-mirrors --allow-root --protocol https arch | grep -v '^#' | sudo tee /etc/pacman.d/mirrorlist"

pkglist() {
  local all=false
  while [[ $# -gt 0 ]]; do
    case $1 in
    -a)
      all=true
      shift
      ;;
    *) return 1 ;;
    esac
  done
  if $all; then
    pacman -Qq | fzf --preview 'paru -Qi {}' --layout=reverse
  else
    pacman -Qqe | fzf --preview 'paru -Qi {}' --layout=reverse
  fi

}

pkgsearch() {
  local aur=false
  while [[ $# -gt 0 ]]; do
    case $1 in
    -a)
      aur=true
      shift
      ;;
    *) return 1 ;;
    esac
  done
  if $aur; then
    paru -Slqa | fzf --preview 'paru -Si {}' --layout=reverse --bind 'enter:execute(paru -S {})'
  else
    pacman -Slq | fzf --preview 'pacman -Si {}' --layout=reverse --bind 'enter:execute(sudo pacman -S {})'
  fi
}

cleanup() {
  sudo pacman -Rns $(pacman -Qtdq)
  paru -Scc
}

# ---------------------------------------------------------------------------- #
#                                COLOR SEQUENCES                               #
# ---------------------------------------------------------------------------- #

cat $HOME/.config/zsh/sequences

# ---------------------------------------------------------------------------- #
#                                     PYENV                                    #
# ---------------------------------------------------------------------------- #

if command -v pyenv 2>&1 >/dev/null; then
  eval "$(pyenv init -)"
  export PY3_10="$HOME/.pyenv/versions/3.10.14/bin/python3.10"
fi

# ---------------------------------------------------------------------------- #
#                              SHELL INTEGRATIONS                              #
# ---------------------------------------------------------------------------- #

eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
