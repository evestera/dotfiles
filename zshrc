# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

unsetopt correct # don't try to autocorrect in shell
setopt append_create # if I try >>foo.txt and foo.txt does not exist, create it

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

if [[ `uname` == 'Darwin' ]]; then
  alias java8='export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)'
  alias java11='export JAVA_HOME=$(/usr/libexec/java_home -v 11)'
  alias java16='export JAVA_HOME=$(/usr/libexec/java_home -v 16)'
  export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

  alias jshell="/usr/libexec/java_home -v 16 --exec jshell "
elif [[ `uname` == 'Linux' ]]; then
  alias open='xdg-open'
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
elif grep -q Microsoft /proc/version; then
  # WSL stuff here
fi

if [[ -s "$HOME/dotfiles/zshrc.local" ]]; then
  source "$HOME/dotfiles/zshrc.local"
fi
