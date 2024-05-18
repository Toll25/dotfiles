# dotfiles
Starting point: Blank Arch install

## Things to install
1. Yay
2. Plasma
3. SDDM
4. Command Line Utilities
5. Envycontrol
6. Other Apps

```bash
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

yay -S alacritty fish ark bat eza rustup docker dolphin envycontrol fastfetch firefox fish fzf \
gimp jump neovim obsidian qalculate-gtk maliit-keyboard spectacle spotify-launcher starship \
steam tree ttf-jetbrains-mono-nerd ttf-ms-win11-auto unzip vesktip-bin vscodium-bin \
vscodium-bin-marketplace pipewire plasma-meta sddm
```
## Things to configure
### Fish
Alias
Config

### Alacritty

### Starship

### Vesktop
Plugins
Theme

### VSCodium
Settings
Theme
Extensions

### Plasma
Shortcuts
Theme
SDDM Theme

### Pacman
Multithreading
Color

### Sudo
Password preview

