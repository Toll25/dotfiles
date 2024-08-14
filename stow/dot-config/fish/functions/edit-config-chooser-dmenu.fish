function edit-config-chooser-dmenu --wraps='set selected_config (command ls ~/.dotfiles/stow/dot-config/ | tofi --width=320 --height=320); test -n "$selected_config"; and alacritty -e nvim ~/.dotfiles/stow/dot-config/"$selected_config" $argv' --description 'alias edit-config-chooser-dmenu=set selected_config (command ls ~/.dotfiles/stow/dot-config/ | tofi --width=320 --height=320); test -n "$selected_config"; and alacritty -e nvim ~/.dotfiles/stow/dot-config/"$selected_config" $argv'
  set selected_config (command ls ~/.dotfiles/stow/dot-config/ | tofi --width=320 --height=320); test -n "$selected_config"; and alacritty -e nvim ~/.dotfiles/stow/dot-config/"$selected_config" $argv $argv
        
end
