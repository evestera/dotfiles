brew cask install basictex

sudo tlmgr update --self
sudo tlmgr install graphics-def
sudo tlmgr install minted
sudo tlmgr install fvextra
sudo tlmgr install ifplatform
sudo tlmgr install xstring
sudo tlmgr install framed
sudo tlmgr install dirtytalk
sudo tlmgr install luatex85
sudo tlmgr install biblatex
sudo tlmgr install biber
sudo tlmgr install logreq
sudo tlmgr install titlesec
sudo tlmgr install emptypage
sudo tlmgr install stmaryrd

# PDF viewer that auto-refreshes
brew cask install skim
# For jumping between Atom and Skim
apm install git@github.com:evestera/skim-displayline.git
