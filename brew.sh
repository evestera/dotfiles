if ! [ -x "$(command -v brew)" ]; then
  echo First, run whatever http://brew.sh says;
  exit 1;
fi

brew install the_silver_searcher
brew install wget
brew install rlwrap
brew install tree
brew install atool
brew install jq
brew install watchexec
brew install python
brew install python3

brew tap caskroom/cask
brew cask install atom
brew cask install iterm2
brew cask install google-chrome
brew cask install spotify
brew cask install nvalt
brew cask install slack
brew cask install spectacle

# Quick Look plugins
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install qlmarkdown

apm install file-icons
apm install editorconfig
apm install expand-region
apm install less-than-slash
apm install set-syntax

apm install language-haskell
apm install language-rust
apm install language-scala
apm install language-latex
