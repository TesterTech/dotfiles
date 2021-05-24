# dotfiles
## About
Dotfiles for the i3 Fedora spin video on the testertech yt channel. This repo contains some pre-config for several programs:
- URxvt
  - Xresources
  - Some color schemes
- Bashrc
- Vimrc
- Autorandr (screen setups)
- i3conf
  - Picom
  - Polybar
  - Compton
- Xmodmap (change the mapping of the mod key)

## How to use
- Repos should already be cloned when running the ```install.sh``` script in the YT video repo https://github.com/TesterTech/Fedora-i3-spin-w-testertech-spin-off
- Proceed as folllows:
- ```cd ~/git/dotfiles```
- run the script ```./make-symlinks.sh```
- Follow the prompts 
  - Be aware that this script doesnot make a backup for you of any existing files!
  - Note: on a clean install a standard .bashrc is often created, it's fine to remove it.
  - i3-wizard also creates a default ~/.config/i3/config file, you can also remove that if you have no config you want to keep. 

- If you start vim (for the first time) it could complain about gruvbox, etc not being installed. Just hit enter and on the main vim screen type ```:PluginInstall``` and hit enter. It will install required plugins and you can exit vim (:q) and load vim again without any errors. 
