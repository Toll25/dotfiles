function edit-nvim-config --wraps='nvim $HOME/.dotfiles/stow/.config/nvim' --wraps='nvim $HOME/.dotfiles/stow/dot-config/nvim' --description 'alias edit-nvim-config=nvim $HOME/.dotfiles/stow/dot-config/nvim'
  nvim $HOME/.dotfiles/stow/dot-config/nvim $argv
        
end
