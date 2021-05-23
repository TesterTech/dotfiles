# dotfiles
## About
Dotfiles for the i3 Fedora spin video on the testertech yt channel. This repo contains some pre-config for several programs:
- URxvt
  - Xresources
- Bashrc
- Vimrc
- Autorandr (screen setups)
- i3conf
  - Picom
  - Polybar
  - Compton
- Xmodmap (change the mapping of the mod key)

## How to use
- mkdir git && cd git
- Clone this repo
- cd into dotfiles
- run the script ./make-symlinks.sh
- Follow the prompts 
  - Be aware that this script doesnot make a backup for you of any existing files!
  - Note: on a clean install a standard .bashrc is often created, it's fine to remove it.
  - i3-wizard also creates a default ~/.config/i3/config file, you can also remove that if you have no config you want to keep. 
