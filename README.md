These are my dotfiles and they include: config files, wallpapers, and scripts.

Current Lineup:
Linux Distro: Fedora
WM/DE: Sway
Terminal: Kitty
Code Editor: Nvim (Kickstart Base)
Terminal File Explorer: Yazi
GUI File Explorer: Thunar
Shell: Fish

I use GNU Stow to manage my dotfiles. My 'dots' are the master folder and the host of the original files I want to save, it is also structured the same as my home directory. To set up the symlinks I just cd into 'dots' and run:
```
stow .
```
