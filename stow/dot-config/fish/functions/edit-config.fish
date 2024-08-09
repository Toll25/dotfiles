function edit-config --wraps='nvim $HOME/.dotfiles' --description 'alias edit-config=nvim $HOME/.dotfiles'
  nvim $HOME/.dotfiles $argv
        
end
