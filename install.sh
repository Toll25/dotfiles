#!/bin/env bash
# Clean slate and install necessary packages
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm neovim

# Edit sudoers file to include pwfeedback
echo "Defaults env_reset,pwfeedback" > /tmp/sudoers.tmp
sudo visudo -c -f /tmp/sudoers.tmp && cat /tmp/sudoers.tmp | EDITOR='tee -a' visudo

# Edit pacman.conf
sudo nvim /etc/pacman.conf \
-c ':%s/^#Color/Color/' \
-c ':%s/^#ParallelDownloads = 5/ParallelDownloads = 16/' \
-c '/# Misc options/+1put =\"ILoveCandy\"' \
-c ':%s/^#\[multilib\]/[multilib]/' \
-c '/\[multilib\]/+1s/^#Include = \/etc\/pacman.d\/mirrorlist/Include = \/etc\/pacman.d\/mirrorlist/' \
-c ':wq'

sudo pacman -Syu --noconfirm

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

yay --save --answerclean All --answerdiff All

file="packages/base.txt"

read_packages() {
    local file="$1"
    local packages=()

    if [ ! -f "$file" ]; then
        echo "$file not found!"
        exit 1
    fi

    while IFS= read -r package
    do
        [[ -z "$package" || "$package" == \#* ]] && continue

        packages+=("$package")
    done < "$file"

    echo "${packages[@]}"
}

packages=($(read_packages "$file"))

if [ ${#packages[@]} -ne 0 ]; then
    echo "Installing packages: ${packages[@]}"
    yay -S --noconfirm "${packages[@]}"
else
    echo "No packages to install."
fi

sudo chsh -s /bin/fish

# Install remaining packages
# Pacman multiple dependencies
# Dotfiles installation using stow
# Change shell
# Set GOPATH
# Git configuration
# Activate bluetooth
# Activate power profiles

# Example placeholders for additional steps
# Uncomment and modify according to your needs

# install_with_pacman <additional_packages>

# Clone dotfiles and use stow to manage them
# git clone https://github.com/yourusername/dotfiles.git
# cd dotfiles
# stow *

# Change shell to zsh (example)
# chsh -s $(which zsh)

# Set GOPATH (example)
# export GOPATH=$HOME/go

# Configure git (example)
# git config --global user.name "Your Name"
# git config --global user.email "your.email@example.com"

# Enable and start Bluetooth service (example)
# systemctl enable bluetooth
# systemctl start bluetooth

# Enable and start power profiles service (example)
# systemctl enable power-profiles-daemon
# systemctl start power-profiles-daemon

echo "Installation and configuration complete!"
