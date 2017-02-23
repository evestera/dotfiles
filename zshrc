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

source "$HOME/dotfiles/zfunctions.zsh"

alias vor='ssh erikadr@vor.ifi.uio.no'
alias yse='ssh 95.215.45.137'

alias sml='PARSER_PRIMARY_PROMPT="$ " PARSER_SECONDARY_PROMPT=">   " rlwrap -p red sml'
alias dotf='atom ~/dotfiles'
alias cdotf='cd ~/dotfiles'

alias java8='export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)'
alias java9='export JAVA_HOME=$(/usr/libexec/java_home -v 9)'
java8

alias jshell="/usr/libexec/java_home -v 9 --exec jshell"
