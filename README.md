# dotfiles
## About
Dotfiles for the i3 Fedora spin video on the testertech yt channel. 
- Xresources
- Bashrc
- Autorandr (screen setups)
- i3wm
- Picom (i3)
- Polybar (i3)
- Compton (i3)
- Vim
- Xmodmap (change the mapping of the mod key)
- URxvt
- Touchpad rc

## How to use
- mkdir git && cd git
- Clone this repo
- cd into dotfiles
- run the script ./make-symlinks.sh
- Be aware that this script doesnot make a backup for you of any existing files!
- Follow the prompts 
  - Note: on a clean install a standard .bashrc is often created, it's fine to remove
  - i3-wizard also creates a default ~/.config/i3/config file, you can also remove that if you have no config you want to keep. 
