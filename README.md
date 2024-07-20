# dotfiles
Starting point: Blank Arch install

## Things to install
```
# Bare Minimum
alacritty
yay
hyprland
brightnessctl
ttf-jetbrains-mono-nerd
blueberry-wayland
waybar
wl-clip-persist
wl-clipboard
xdg-desktop-portal-hyprland
fish
tree
dex
eza
less
fzf
ctags
cliphist
bat
fuzzel
hypridle
hyprlock
hyprpaper
hyprpicker
hyprshot
neovim
network-manager-applet
network-manager 
power-profiles-daemon
stow
swaync
kdeconnect
pamixer
pavucontrol
qalculate-gtk
qt5ct
qt6ct
ripgrep
starship
man-db

# Other

## Important System things
firefox
dolphin
libreoffice-fresh

## File Viewers and Dolphin plugins
kdegraphics-thumbnailers
kimageforamts
qt6-imageformats
resvg
kdesdk-thumbnailers
ffmpegthumbs
raw-thumbnailer
taglib
kompare
dolphin-plugins
udiskie
ark
okular
qbittorrent

## Art Programms
inkscape
kdenlive
krita
obs-studio
pixelorama-bin
cura-bin

## Development Tools
rustup
qemu-full
virt-manager
go 
npm
pnpm
docker
docker-compose
yarn
git-filter-repo

## Command Line utils
btop
pacseek
taskwarrior-tui
lostfiles
envycontrol
jump
nushell
unzip
fastfetch

## Other GUI apps
obsidian
spotify
steam
vesktop

## Extra Fonts
ttf-ms-win11-auto
noto-fonts-cjk
ttf-joypixels

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
