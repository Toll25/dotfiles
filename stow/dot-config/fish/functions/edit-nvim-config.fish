function edit-nvim-config --wraps='nvim $HOME/.dotfiles/stow/.config/nvim' --wraps='nvim $HOME/.dotfiles/stow/dot-config/nvim' --wraps='cd /home/elena/.dotfiles/stow/dot-config/nvim nvim .' --wraps='cd /home/elena/.dotfiles/stow/dot-config/nvim | nvim .' --wraps='cd /home/elena/.dotfiles/stow/dot-config/nvim && nvim .' --description 'alias edit-nvim-config=cd /home/elena/.dotfiles/stow/dot-config/nvim && nvim .'
  cd /home/elena/.dotfiles/stow/dot-config/nvim && nvim . $argv
        
end
