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
#                                  DIRECTORIES                                 #
# ---------------------------------------------------------------------------- #

hypr="$HOME/Hypr"
niri="$HOME/Niri"
conf="$HOME/Conf"

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
alias conf="code $conf"
alias hypr="code $hypr"
alias wifi="nmtui connect"
alias clock="peaclock"
alias zshrc="nano $HOME/.zshrc"
alias reload="source $HOME/.zshrc"

function ff() {
  if [[ $XDG_CURRENT_DESKTOP == 'Hyprland' ]]; then
    fastfetch --config $hypr/fastfetch/hyprland.jsonc
  elif [[ $XDG_CURRENT_DESKTOP == 'GNOME' ]]; then
    fastfetch --config $hypr/fastfetch/gnome.jsonc
  elif [[ $XDG_CURRENT_DESKTOP == 'niri' ]]; then
    fastfetch --config $niri/fastfetch/niri.jsonc
  fi
}

function log-out() {
  if [[ $XDG_CURRENT_DESKTOP == "Hyprland" ]]; then
    echo "Session found: Hyprland. Logging out..."
    sleep 2
    hyprctl dispatch exit
  elif [[ $XDG_CURRENT_DESKTOP == "GNOME" ]]; then
    echo "Session found: GNOME. Logging out..."
    sleep 2
    gnome-session-quit --no-prompt
  elif [[ $XDG_CURRENT_DESKTOP == "niri" ]]; then
    echo "Session found: Niri. Logging out..."
    sleep 2
    pkill niri
  else
    echo "Unknown session: $XDG_CURRENT_DESKTOP."
  fi
}

# ---------------------------------------------------------------------------- #
#                                    PACMAN                                    #
# ---------------------------------------------------------------------------- #

alias inst="paru -S"
alias uninst="paru -Rns"
alias up="paru -Syu"
alias mirrors="rate-mirrors --allow-root --protocol https arch | grep -v '^#' | sudo tee /etc/pacman.d/mirrorlist"
function pkglist() {
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

function pkgsearch() {
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

function cleanup() {
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
