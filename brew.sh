# First, run whatever http://brew.sh says

brew tap caskroom/cask
brew cask install atom
brew cask install iterm2
brew cask install google-chrome
brew cask install spotify

curl https://sh.rustup.rs -sSf | sh

chsh -s /bin/zsh

apm install file-icons
apm install editorconfig
apm install expand-region
