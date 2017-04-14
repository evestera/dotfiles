
export PURE_PROMPT_SYMBOL='>'
prompt pure

function open() {
  cmd.exe /c "start $1"
}

function atom() {
  cmd.exe /c "atom $1"
}
