function wallpaper-chooser-dmenu --wraps='set-wallpaper ~/.local/share/wallpapers/$(command ls ~/.local/share/wallpapers/ | tofi --width 200 --height 200) > /dev/null' --wraps='command ls ~/.local/share/wallpapers/ | tofi --width 200 --height 200 | set-wallpaper ~/.local/share/wallpapers/{} > /dev/null' --description 'alias wallpaper-chooser-dmenu=command ls ~/.local/share/wallpapers/ | tofi --width 200 --height 200 | set-wallpaper ~/.local/share/wallpapers/{} > /dev/null'
  command ls ~/.local/share/wallpapers/ | tofi --width 200 --height 200 | set-wallpaper ~/.local/share/wallpapers/{} > /dev/null $argv
        
end
