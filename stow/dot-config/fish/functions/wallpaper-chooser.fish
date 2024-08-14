function wallpaper-chooser --wraps=command\ ls\ \~/.local/share/wallpapers/\ \|\ fzf\ --bind\ \'enter:become:set-wallpaper\ \~/.local/share/wallpapers/\{\}\'\ \>\ /dev/null --description alias\ wallpaper-chooser=command\ ls\ \~/.local/share/wallpapers/\ \|\ fzf\ --bind\ \'enter:become:set-wallpaper\ \~/.local/share/wallpapers/\{\}\'\ \>\ /dev/null
  command ls ~/.local/share/wallpapers/ | fzf --bind 'enter:become:set-wallpaper ~/.local/share/wallpapers/{}' > /dev/null $argv
        
end
