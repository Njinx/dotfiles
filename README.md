# Njinx's dotfiles and scripts

### Includes
- i3wm
- vim
- Xresources
- zsh
- rofi
- dunst
- betterlockscreen
- barista bar (i3 bar replacement)
- dolphin-emu
- vscode

## Installation

Deployed with [GNU Stow](https://www.gnu.org/software/stow/).

### Stow directories
- `home/` - files with base path `$HOME`.
- `root/` - files with base path `/`.

### Examples

Deploying zsh dotfiles
```sh
dotfiles $ cd home/
dotfiles/home $ stow zsh
...
dotfiles/home $ stow shell # Shell-agnostic files
...
```

Deploying rofi
```sh
dotfiles $ cd home/
dotfiles/home $ stow rofi
...
# Rofi has config files outside $HOME 
# so we have to deploy those as well.
dotfiles/home $ cd ../root
dotfiles/root $ sudo stow rofi
...
```
