#!/bin/bash

################################################################
# Bootstrap the system for the first time 
################################################################

if [ -f ~/.homebase_bootstrap ]; then
    echo "System bootstrap has already occurred."
    exit 0
fi

mkdir .homebase

# Homebrew
if ! [ -x "$(brew)" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  # Cask
  brew tap caskroom/cask

  # Standard
  brew cask install google-chrome       # Chrome
  brew cask install dashlane            # Dashlane
  brew cask install vlc                 # VLC

  # Dev Tools
  brew install git                      # Git
  brew install node                     # Node
  brew install nvim                     # Neovim
  brew install emacs                    # Emacs
  brew install go                       # Go
  brew install cmake                    # CMake
  brew install scons                    # SCons
  brew cask install haskell-platform    # Haskell
  brew cask install iterm2              # iTerm2
  brew cask install visual-studio-code  # VsCode
  brew cask install sourcetree          # Sourcetree
  brew cask install mysqlworkbench      # MySQL Workbench
  brew cask install virtualbox          # VirtualBox
  brew cask install vagrant             # Vagrant 
  brew cask install docker              # Docker

  # Misc
  brew cask install disk-inventory-x    # Disk Inventory X
  brew cask install spotify             # Spotify
  brew cask install slack               # Slack
  brew cask install beardedspice        # Bearded Spice
fi

# Misc
npm install -g livedown               # Livedown

# Setup neovim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim # Install Vundle
pip3 install --user neovim                       # Install python support for neovim
vim +PluginInstall +qall                         # Install Vundle plugins
~/.vim/bundle/YouCompleteMe/install.py --all     # Setup YouCompleteMe

# Fancy Git Diff
cd ~/.homebase
curl https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy --output diff-so-fancy
git config --global core.pager "~/.homebase/diff-so-fancy | less --tabs=4 -RFX"
git config --global color.ui true
git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"
git config --global color.diff.meta       "yellow"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"

# Setup directories
mkdir ~/Development

# Add marker for bootstrap complete
touch ~/.homebase_bootstrap
