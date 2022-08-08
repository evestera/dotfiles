# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

unsetopt correct # don't try to autocorrect in shell
setopt append_create # if I try >>foo.txt and foo.txt does not exist, create it

export PATH="$HOME/.cargo/bin:$PATH"

if [[ -s "/usr/local/bin/brew" ]]; then
  eval $(/usr/local/bin/brew shellenv)
elif [[ -s "/opt/homebrew/bin/brew" ]]; then
  eval $(/opt/homebrew/bin/brew shellenv)
fi

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/dotfiles/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

export VISUAL=vim
export EDITOR=vim
export GUI_EDITOR=atom

source "$HOME/dotfiles/zfunctions.zsh"

alias yse='ssh 95.215.45.137'

alias dotf="$GUI_EDITOR ~/dotfiles"
alias cdotf="cd ~/dotfiles"
alias cg="cd ~/gitproj"
alias kladd="$GUI_EDITOR ~/kladd"
alias ckladd="cd ~/kladd"
alias mtg="~/mtg/mtg"
alias ut="ut.ts"

alias jshell="jshell --startup DEFAULT --startup PRINTING --startup ~/dotfiles/startup.jsh"

alias power="system_profiler SPPowerDataType"

if [[ `uname` == 'Darwin' ]]; then
  # MacOS-specific stuff
elif [[ `uname` == 'Linux' ]]; then
  alias open='xdg-open'
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
elif grep -q Microsoft /proc/version; then
  # WSL stuff here
fi

if [[ -s "$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh" ]]; then
  source $HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh
fi

if [ -x "$(command -v fnm)" ]; then
  eval "$(fnm env --use-on-cd)"
fi

if [[ -s "$HOME/dotfiles/zshrc.local" ]]; then
  source "$HOME/dotfiles/zshrc.local"
fi
