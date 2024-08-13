# Things to change/add
Add okularpartrc
Add nvim auto updater
Get new Dmenu
Yay, theming
tofi transparency
Fix bufferline keybinds
Revisit plugin choices (performance)

# REMINDER = FISH SET PERM `set -Ux`
fzf command
```fish
set -Ux FZF_DEFAULT_OPTS "\
  --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
  --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
  --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
  --color=selected-bg:#45475a \
  --multi \
  --border rounded \
  --height 40% \
  --layout reverse \
  "
```

Rip grep command
```fish
fzf --disabled --ansi \
    --bind "start:reload:rg --column --color=always --smart-case {q} || :" \
    --bind "change:reload:rg --column --color=always --smart-case {q} || :" \
    --bind 'enter:become:nvim {1} +{2}' \
    --bind 'ctrl-o:execute:nvim {1} +{2}' \
    --delimiter ':' \
    --preview 'bat --style=full --color=always --highlight-line {2} {1}' \
    --preview-window '~4,+{2}+4/3,<80(up)'
```

## Tofi things
### SSH
cat ~/.ssh/known_hosts | awk '{print $1}' | sed 's/,.*//' | sort -u | dmenu | xargs -r ssh
### Script Runner
ls ~/scripts | dmenu | xargs -I {} sh ~/scripts/{}
### Project Opener (Needs to be fixed)
find ~/Documents -type f | dmenu | xargs -r xdg-open
### Wallpaper selector
### Brightness?
### Emoji/Nerdfonts
### Quick Todo?
### Config quick opener
### Picker for all of these
### Frequent folders with filemanager

## FZF
### FZF in current directory (Shortcut or alias)
### Envirment browse
export $(printenv | fzf)
### Docker Stuff
### SSH
### Script Runner
### Project Opener
### Interactive copy / move
find ~/Documents/ -type f | fzf -m | xargs -I {} cp {} ~/Downloads/
### Config quick opener
### Interactive ripgrep
### Systemctl finder

### Pfusch
begin; find /usr/share/applications/ -type f -name "*.desktop"; find ~/.local/share/applications/ -type f -name "*.desktop"; end | fzf  --preview 'bat {}' --bind 'enter:execute(nvim {})+abort'

## Scripts
Trash things
Clean everything (yay -Sc Yc Trash ...)

## Nvim notes
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

# Install Steps

## Things to do in install 
- Pacman Config 
- Sudo Config 
- GreetD config 
- Dotfiles Stow 
- Dotfiles preemptive folders to prevent false symlinks 
- Nvim install and update
- Fix braile font
- Add cargo install 
- Fix Fish paths

## Legacy

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
