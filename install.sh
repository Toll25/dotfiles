#!/bin/env bash
# Ensure the script is running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

install_with_pacman() {
  local packages=("$@")
  for package in "${packages[@]}"; do
    until pacman -S --noconfirm "$package"; do
      echo "Pacman install of $package failed. Retrying..."
      sleep 5
    done
  done
}

# Clean slate and install necessary packages
pacman -Syu --noconfirm
install_with_pacman git


# Edit sudoers file to include pwfeedback
echo "Defaults env_reset,pwfeedback" > /tmp/sudoers.tmp
visudo -c -f /tmp/sudoers.tmp && cat /tmp/sudoers.tmp | EDITOR='tee -a' visudo

# Edit pacman.conf
vim /etc/pacman.conf -c ':%s/^#Color/Color/' -c ':%s/^#ParallelDownloads = 5/ParallelDownloads = 16/' -c '/# Misc options/put! =\"ILoveCandy\"' -c ':%s/^#\[multilib\]/[multilib]/' -c ':%s/^#Include = \/etc\/pacman.d\/mirrorlist/Include = \/etc\/pacman.d\/mirrorlist/' -c ':wq'

# Install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

# Install remaining packages
# Pacman failsafe
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

