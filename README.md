# dotfiles
Starting point: Blank Arch install

## Things to install
```bash
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

yay -S alacritty fish ark bat eza rustup docker dolphin envycontrol fastfetch firefox fish fzf \
gimp jump neovim obsidian qalculate-gtk maliit-keyboard spectacle spotify-launcher starship \
steam tree ttf-jetbrains-mono-nerd ttf-ms-win11-auto unzip vesktop-bin vscodium-bin \
vscodium-bin-marketplace pipewire plasma-meta sddm stow xclip
```
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

- [ ] Powermenu for Hyprland
- [ ] Dependency update
- [ ] Better install instruction (makepkg?)
- [X] One folder for wallpapers
- [ ] Optimise Nvim (remove redundencies)
- [X] Add Breeze cursor
- [ ] Missing configs (waybar, swaync, wofi)
- [X] fix dolphin theming
- [X] fix clipboard history
- [X] fix hyprpaper
- [ ] new colorzier plugin
- [ ] configure neotree
