#!/bin/bash
echo [dotfiles] Make Symlinks to ~/git/dotfiles/ ... 
if [[ -d ~/git/dotfiles ]]; 
then

remove_existing_file() {
if test -f "$1"; then
  FILE="$1"
  echo [dotfiles] $FILE passed to the function
  while true; do
    read -p "[dotfiles] Do you want to remove $FILE? " yn
    case $yn in
        [Yy]* ) rm ${FILE}; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer y (yes) or n (no), hit control C to stop script.";;
    esac
  done
fi
}
# Clean?
remove_existing_file "$HOME/.Xresources"
remove_existing_file "$HOME/.bashrc"
remove_existing_file "$HOME/.config/autorandr"
remove_existing_file "$HOME/.config/i3/config"
remove_existing_file "$HOME/.config/picom"
remove_existing_file "$HOME/.config/polybar"
remove_existing_file "$HOME/.config/compton.conf"
remove_existing_file "$HOME/.xfiles"
remove_existing_file "$HOME/.vimrc"
remove_existing_file "$HOME/.Xmodmap"
ln -s ~/git/dotfiles/Xresources ~/.Xresources
ln -s ~/git/dotfiles/bashrc ~/.bashrc
ln -s ~/git/dotfiles/config/autorandr/ ~/.config/autorandr
ln -s ~/git/dotfiles/config/i3/config ~/.config/i3/config
ln -s ~/git/dotfiles/config/picom ~/.config/picom
ln -s ~/git/dotfiles/config/polybar ~/.config/polybar
ln -s ~/git/dotfiles/config/compton.conf ~/.config/compton.conf
ln -s ~/git/dotfiles/xfiles/ ~/.xfiles
ln -s ~/git/dotfiles/vimrc ~/.vimrc
ln -s ~/git/dotfiles/Xmodmap ~/.Xmodmap 
else
        echo Missing the dotfiles dir in the git folder!
fi
echo [vim] Plug for Vim plugin management
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo [vim] Pathogen  
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

