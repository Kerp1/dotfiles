#!/bin/bash

#Directory where the dotfiles are located.
DOTFILES_DIR=$HOME/.dotfiles
#Directory where the configuration files should be symlinked to.
CONFIG_DIR=$HOME/.config
#List of directories that a symlink to a config file should be created in.
CONFIG_DIRECTORIES=("i3" "i3status")

ln -si $DOTFILES_DIR/oh-my-zsh $HOME/.oh-my-zsh
ln -si $DOTFILES_DIR/zshrc $HOME/.zshrc
ln -si $DOTFILES_DIR/zlogin $HOME/.zlogin
ln -si $DOTFILES_DIR/my-zsh/plugins/zsh-syntax-highlighting $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

ln -si $DOTFILES_DIR/vimrc $HOME/.vimrc
ln -si $DOTFILES_DIR/xinitrc $HOME/.xinitrc

ln -si $DOTFILES_DIR/Xresources $HOME/.Xresources
ln -si $DOTFILES_DIR/Xresources $HOME/.Xdefaults

sh $DOTFILES_DIR/bin/urxvt-tabbed/install


mkdir $CONFIG_DIR
for directory in "${CONFIG_DIRECTORIES[@]}"
do
  echo "Symlinking configuration for $directory"
  mkdir $CONFIG_DIR/$directory
  ln -si $DOTFILES_DIR/config/$directory/config $CONFIG_DIR/$directory/config
done
