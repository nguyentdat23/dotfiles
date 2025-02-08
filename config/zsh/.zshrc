# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Source additional local files if they exist.
[[ -f ~/.config/zsh/zprofile.local ]] && source ~/.config/zsh/zprofile.local

# Extend PATH.
export PNPM_HOME="$XDG_DATA_HOME/pnpm"
typeset -U path
path=(
  /usr/local/{bin,sbin}
  $HOME/dotfiles/bin
  /opt/homebrew/bin
  $ANDROID_SDK_ROOT/emulator
  $ANDROID_SDK_ROOT/tools
  $ANDROID_SDK_ROOT/tools/bin
  $ANDROID_SDK_ROOT/platform-tools
  $XDG_DATA_HOME/nvim/mason/bin
  $PNPM_HOME
  $path
)

# Options

# Emacs mode in ZLE
bindkey -e

# Zsh history
export HISTFILE="$ZDOTDIR/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY  # Add to history right after executing
setopt SHARE_HISTORY  # Read history while executing commands
setopt EXTENDED_HISTORY
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS

# Directory stack
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

# Misc
setopt AUTO_CD
setopt EXTENDED_GLOB

# Terminal tab title
tab_title_precmd() {
  print -Pn "\e]0;$(basename $(pwd))\a"
}
typeset -a precmd_functions
precmd_functions+=(tab_title_precmd)

# Includes
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/prompt.zsh
source $ZDOTDIR/completion.zsh

# Keybindings

# Search history more nicely with up/down
autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

bindkey "^O" clear-screen

# Suspend and foreground Neovim with ctrl+z
foreground-nvim() {
  fg %nvim
}
zle -N foreground-nvim
bindkey '^Z' foreground-nvim

# Ctrl+W to delete until "/"
autoload -U select-word-style
select-word-style bash

# Alt+left/right to move by word
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# Plugins

# FZF
BREW_PREFIX="$(brew --prefix)"
source "$BREW_PREFIX/opt/fzf/shell/completion.zsh"
source "$BREW_PREFIX/opt/fzf/shell/key-bindings.zsh"

source $ZDOTDIR/.packages/zsh-z/zsh-z.plugin.zsh
source $ZDOTDIR/.packages/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $ZDOTDIR/.packages/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/.packages/fzf-tab/fzf-tab.plugin.zsh
source $ZDOTDIR/.packages/zsh-manydots-magic/manydots-magic
source $ZDOTDIR/.packages/powerlevel10k/powerlevel10k.zsh-theme
# Extra functions

function take() { [[ $# == 1 ]] && mkdir -p -- "$1" && cd -- "$1" }
compdef _directories take

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh


# environent variables
export spring_profiles_active=local,dev
