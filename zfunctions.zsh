function mkcd() {
  mkdir -p "$@" && cd ${@: -1};
}

function texd() {
  open "http://texdoc.net/pkg/$1";
}

function wtf_header() {
  echo "\x1b[34m${1}:\x1b[0m"
}

function wtf_echo() {
  echo $1 |& sed 's/^/  /'
}

function wtf() {
  wtf_header "type";
  wtf_echo "$(whence -vas $1)";
  local FULLPATH=$(which $1);
  if [[ $FULLPATH =~ ^/ ]]; then
    wtf_header "ls";
    wtf_echo "$(CLICOLOR_FORCE=1 ls -alhG $FULLPATH)";
    wtf_header "file";
    wtf_echo "$(file -b $FULLPATH)";
  fi
  wtf_header "whatis";
  wtf_echo "$(whatis $1 | grep "^$1" | head -3)";
  if (( $+commands[brew] )); then
    wtf_header "brew";
    if [[ $FULLPATH =~ ^/ ]]; then
      local FORMULA=${${${$(realpath $FULLPATH)##*/Cellar/}%%/*}:-$1}
    else
      local FORMULA=$1
    fi
    if (( $+commands[jq] )); then
      local JQ='
        "Formula: \(.[0].name)",
        .[0].desc,
        "Stable: \(.[0].versions.stable) Installed: \(.[0].installed[-1].version)",
        "Homepage: \(.[0].homepage)"
      ';
      wtf_echo "$(brew info --json=v1 $FORMULA | jq -r $JQ)";
    else
      wtf_echo "$(brew info $FORMULA | head -4)";
    fi
  fi
}
