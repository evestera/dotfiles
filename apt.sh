if ! [ -x "$(command -v apt)" ]; then
  echo "Oops, no apt command found";
  exit 1;
fi

sudo apt install xclip
sudo apt install silversearcher-ag
sudo apt install jq
sudo apt install curl
sudo apt install tree
