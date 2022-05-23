# Dotfiles

Config files for my hosts

Current config:

- OS: Arch Linux
- Terminal: Kitty
- Shell: zsh
- WM: i3-gaps
- Login Manager: Ly
- Theme: gruvbox
- Font: JetBrainsMono (Nerd Font)
- Editor: NeoVim (NvChad)
- GUI File explorer: thunar
- CLI File explorer: nnn
- PDF Reader: Zathura

## Inspirations

- https://github.com/k-vernooy/dotfiles

## Setup:
```Shell
git init --bare ~/.dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config config status.showUntrackedFiles no
```

Add this repos to remote (or the fork of this repos).

### Dependencies

Lots of packages, WIP...

- system:`brightnessctl alsa-utils blueman neovim pavucontrol`

- rice:`i3-gaps i3lock zsh kitty feh rofi flameshot polybar thunar xautolock zathura zathura-pdf-mupdf`

- nice utils:`peek tree nnn spotify-tui`
