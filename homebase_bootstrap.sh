#!/bin/bash

################################################################
# Bootstrap the system for the first time 
################################################################

if [ -f ~/.homebase_bootstrap ]; then
    echo "System bootstrap has already occurred."
    exit 0
fi

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
  brew install node                     # Node
  brew install nvim                     # Neovim
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

# Nix
if ! [ -x "$(nix-env)" ]; then
  curl https://nixos.org/nix/install | sh

  nix-env --install git
  nix-env -iA nixpkgs.neovim
  nix-env -iA nixpkgs.python35Packages.neovim
fi

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Setup directories
mkdir ~/Development

touch ~/.homebase_bootstrap
