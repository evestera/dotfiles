source ~/dotfiles/aliases
source ~/dotfiles/fzfbash.sh

export PATH="$HOME/.local/bin:$PATH"

shopt -s histappend
export HISTCONTROL=ignoreboth
export HISTFILESIZE=10000
export HISTSIZE=10000
export PROMPT_COMMAND='history -a'

first() {
  echo $1
}

c() {
  if [[ $# -eq 0 ]] ; then
      cd
      dirs +0
      return 0
  fi

  for var in "$@"
  do
      cd $(first $var) 2>/dev/null || cd $(first $var*) 2>/dev/null || cd $(first *$var*) || return 1
  done

  pushd .>/dev/null
  dirs +0
}

alias cg="c && c git"

urlencode() {
    # urlencode <string>
    old_lc_collate=$LC_COLLATE
    LC_COLLATE=C

    local length="${#1}"
    for (( i = 0; i < length; i++ )); do
        local c="${1:i:1}"
        case $c in
            [a-zA-Z0-9.~_-]) printf "$c" ;;
            *) printf '%%%02X' "'$c" ;;
        esac
    done

    LC_COLLATE=$old_lc_collate
}

urldecode() {
    # urldecode <string>
    local url_encoded="${1//+/ }"
    printf '%b' "${url_encoded//%/\\x}"
}
