function mkcd() {
  mkdir -p "$@" && cd ${@: -1};
}

function texd() {
  open "http://texdoc.net/pkg/$1";
}

function wat() {
  which $1
  whence -vas $1
}

function portkill() {
  kill -9 $(lsof -t -i:$1)
}
