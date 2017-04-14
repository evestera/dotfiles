# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

if [[ "$(uname)" == 'Darwin' ]]; then
  source "$HOME/dotfiles/mac-zshrc.zsh"
elif grep -q Microsoft /proc/version; then
  source "$HOME/dotfiles/wsl-zshrc.zsh"
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

