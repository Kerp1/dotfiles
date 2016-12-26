#!/bin/bash

#Directory where the dotfiles are located.
DOTFILES_DIR=$HOME/.dotfiles
#Directory where the configuration files should be symlinked to.
CONFIG_DIR=$HOME/.config

ln -s $DOTFILES_DIR/oh-my-zsh $HOME/.oh-my-zsh
ln -s $DOTFILES_DIR/zshrc $HOME/.zshrc
ln -s $DOTFILES_DIR/zlogin $HOME/.zlogin
ln -s $DOTFILES_DIR/my-zsh/plugins/zsh-syntax-highlighting $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

ln -s $DOTFILES_DIR/vimrc $HOME/.vimrc
ln -s $DOTFILES_DIR/xinitrc $HOME/.xinitrc

ln -s $DOTFILES_DIR/Xresources $HOME/.Xresources
ln -s $DOTFILES_DIR/Xresources $HOME/.Xdefaults

sh $DOTFILES_DIR/bin/urxvt-tabbed/install


mkdir $CONFIG_DIR
for directory in `ls config`
do
  echo "Symlinking configuration for $directory"
  mkdir $CONFIG_DIR/$directory
  ln -s $DOTFILES_DIR/config/$directory/config $CONFIG_DIR/$directory/config
done
