# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

if [[ -s "$HOME/dotfiles/zshrc.local" ]]; then
  source "$HOME/dotfiles/zshrc.local"
fi

unsetopt correct # don't try to autocorrect in shell
setopt append_create # if I try >>foo.txt and foo.txt does not exist, create it

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/dotfiles/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

export VISUAL=vim
export EDITOR=vim

source "$HOME/dotfiles/zfunctions.zsh"

alias vor='ssh erikadr@vor.ifi.uio.no'
alias yse='ssh 95.215.45.137'

alias sml='PARSER_PRIMARY_PROMPT="$ " PARSER_SECONDARY_PROMPT=">   " rlwrap -p red sml'
alias dotf='atom ~/dotfiles'
alias cdotf='cd ~/dotfiles'

if [[ `uname` == 'Darwin' ]]; then
  alias java8='export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)'
  alias java9='export JAVA_HOME=$(/usr/libexec/java_home -v 9)'
  java8

  alias jshell="/usr/libexec/java_home -v 9 --exec jshell"
elif [[ `uname` == 'Linux' ]]; then
  alias open='xdg-open'
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
elif grep -q Microsoft /proc/version; then
  # WSL stuff here
fi
