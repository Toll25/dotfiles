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

yay --save --answerclean None --answerdiff None

file="$HOME/.dotfiles/packages/base.txt"

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

chsh -s /bin/fish

$HOME/.dotfiles/stow/.bin/stow-config

git config --global user.name "Toll"
git config --global user.email "toll25@proton.me"
git config --global init.defaultBranch main

fish -c "set GOPATH $HOME/.local/share/go"

# Enable and start Bluetooth service (example)
# systemctl enable bluetooth
# systemctl start bluetooth

# Enable and start power profiles service (example)
# systemctl enable power-profiles-daemon
# systemctl start power-profiles-daemon

echo "Installation and configuration complete!"
