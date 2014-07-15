#!/bin/bash
# Simple setup.sh for configuring OSX based off the ogiginal for configuring Ubuntu 12.04 LTS EC2 instance for headless setup. 
# This one is just for my local OSX machine

# Install Xcode
# Install developer command-line tools

# install homebrew and other packages
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew install coreutils
brew install wget
# brew install grep --default-names # doesn't work
brew install gzip
# brew install screen # doesn't work
brew install node
brew install emacs --use-git-head --HEAD

# # Install nvm: node-version manager                                                                                                                                                                                                                     
# # https://github.com/creationix/nvm                                                                                                                                                                                                                     
# # ubuntu # sudo apt-get install -y git
# # ubuntu # sudo apt-get install -y curl
# curl https://raw.github.com/creationix/nvm/master/install.sh | sh


# Install jshint to allow checking of JS code within emacs                                                                                                                                                                                              
# http://jshint.com/                                                                                                                                                                                                                                    
npm install -g jshint

# Install Grunt for automated node builds                                                                                                                                                                                                               
# http://gruntjs.com/getting-started for details                                                                                                                                                                                                        
npm install -g grunt-cli
npm install -g grunt-init

# Install Bower for front-end package management                                                                                                                                                                                                               
# http://http://bower.io/ for details                                                                                                                                                                                                        
npm install -g bower

# Install yeoman for project building
npm install -g yo

# # Install Heroku toolbelt                                                                                                                                                                                                                               
# # https://toolbelt.heroku.com/debian                                                                                                                                                                                                                    
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# # Load nvm and install latest production node                                                                                                                                                                                                           
# source $HOME/.nvm/nvm.sh
# nvm install v0.10.12
# nvm use v0.10.12

# # Install rlwrap to provide libreadline features with node                                                                                                                                                                                              
# # See: http://nodejs.org/api/repl.html#repl_repl                                                                                                                                                                                                        
# sudo apt-get install -y rlwrap

# # Change OSX preferences
# Disable dashboard
defaults write com.apple.dashboard mcx-disabled -boolean YES && killall Dock



# git pull and install dotfiles as well                                                                                                                                                                                                                 
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
# TODO: fix the -b on these links to make dotfiles work
git clone https://github.com/johnelliott/dotfiles.git
ln -s dotfiles/.screenrc .
ln -s dotfiles/.bash_profile .
ln -s dotfiles/.bashrc .
ln -s dotfiles/.bashrc_custom .
ln -sf dotfiles/.emacs.d .
