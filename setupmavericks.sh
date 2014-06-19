#!/bin/bash
# Simple setup.sh for configuring OSX based off the ogiginal for configuring Ubuntu 12.04 LTS EC2 instance for headless setup. 
# This one is just for my local OSX machine

# install homebrew and other packages
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew install coreutils
brew install wget
brew install grep --default-names
brew install gzip
brew install screen
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

# # Load nvm and install latest production node                                                                                                                                                                                                           
# source $HOME/.nvm/nvm.sh
# nvm install v0.10.12
# nvm use v0.10.12

# # Install rlwrap to provide libreadline features with node                                                                                                                                                                                              
# # See: http://nodejs.org/api/repl.html#repl_repl                                                                                                                                                                                                        
# sudo apt-get install -y rlwrap


# # Install Heroku toolbelt                                                                                                                                                                                                                               
# # https://toolbelt.heroku.com/debian                                                                                                                                                                                                                    
# wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh



# git pull and install dotfiles as well                                                                                                                                                                                                                 
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
git clone https://github.com/johnelliott/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sf dotfiles/.emacs.d .