function edit-nvim-config --wraps='nvim $HOME/.dotfiles/stow/.config/nvim' --description 'alias edit-nvim-config=nvim $HOME/.dotfiles/stow/.config/nvim'
    nvim $HOME/.dotfiles/stow/.config/nvim $argv

end
