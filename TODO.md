# Install Steps

Clean Slate

pacman -S git neovim

export EDITOR=nvim 

visodo

Insert `Defaults env_reset,pwfeedback` at end

sudoedit /etc/pacman.conf 
Uncomment Color
Uncomment ParallelDownloads, set to 16
Insert ILoveCandy
Uncomment multilib header and mirrorlist


Install yay
```bash
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```
Remove yay directory

Install rest
*Pacman failsafe*
*Pacman multiple dependencies*

Install dotfiles (with https), stow

Change shell

*set gopath*
*GIT CONFIG*
*activate bluetooth*
*activeate power profiles*
