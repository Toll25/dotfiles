function edit-config-chooser --wraps='command ls ~/.dotfiles/stow/dot-config/ | fzf --bind "enter:become:nvim ~/.dotfiles/stow/dot-config/{}"' --description 'alias edit-config-chooser=command ls ~/.dotfiles/stow/dot-config/ | fzf --bind "enter:become:nvim ~/.dotfiles/stow/dot-config/{}"'
  command ls ~/.dotfiles/stow/dot-config/ | fzf --bind "enter:become:nvim ~/.dotfiles/stow/dot-config/{}" $argv
        
end
