# dotfiles
Starting point: Blank Arch install

## Things to install
```
## Bluetooth
blueberry-wayland

## Important System things
dolphin
firefox
libreoffice-fresh
dex
kdeconnect
qalculate-gtk

## File Viewers and Dolphin plugins
ark
dolphin-plugins
ffmpegthumbs
kdegraphics-thumbnailers
kdesdk-thumbnailers
kimageforamts
kompare
okular
qbittorrent
qt6-imageformats
raw-thumbnailer
resvg
taglib
udiskie

## Art Programms
cura-bin
inkscape
kdenlive
krita
obs-studio
pixelorama-bin

## Development Tools
docker
docker-compose
git-filter-repo
go 
npm
pnpm
qemu-full
rustup
virt-manager
yarn

## Command Line utils
btop
envycontrol
fastfetch
lostfiles
nushell
pacseek
taskwarrior-tui
unzip
tree

## Other GUI apps
obsidian
spotify
steam
vesktop

## Extra Fonts And Color
noto-fonts-cjk
ttf-joypixels
ttf-ms-win11-auto
qt5ct
qt6ct

```
Dolphin plugins !!!!
Bluetooth !!!!
## Setup
- Run Envycontrol `sudo envycontrol -s hybrid --rtd3`
- Stow Dotfiles `stow -t ~ .`
- Change Shell `chsh -s /bin/fish`
- Plasma Theme `https://github.com/catppuccin/kde`
- Vesktop Theme `https://catppuccin.github.io/discord/dist/catppuccin-mocha-mauve.theme.css`
- Import Vesktop Settings `vencord-settings.json`
- Install VSC Extensions `cat vscodium-extensions.txt | xargs -n 1 codium --install-extension`
- Pacman Configs `/etc/pacman.conf` 
  1. Uncomment `COLOR` 
  2. Set `ParallelDownloads = 16`
- Sudo Config `/etc/sudoers`
  - Add `Defaults env_reset,pwfeedback`
- Configure Plasma Shortcuts
- Configure Everything else Plasma

## TODO

- [ ] Dependency update
- [ ] Better install instruction (makepkg?)
