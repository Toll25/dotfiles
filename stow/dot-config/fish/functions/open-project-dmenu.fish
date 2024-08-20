function open-project-dmenu --wraps='alacritty -e nvim ~/Documents/Projects/' --wraps='alacritty -e nvim ~/Documents/Projects/$(command ls ~/Documents/Projects/ | tofi)' --wraps='alacritty -e nvim ~/Documents/Projects/$(command ls ~/Documents/Projects/ | tofi --width=200)' --wraps='alacritty -e nvim ~/Documents/Projects/$(command ls ~/Documents/Projects/ | tofi --width=240)' --wraps='alacritty -e nvim ~/Documents/Projects/$(command ls ~/Documents/Projects/ | tofi --width=320)' --wraps='alacritty -e nvim ~/Documents/Projects/$(command ls ~/Documents/Projects/ | tofi --width=320 --height=240)' --wraps='alacritty -e nvim ~/Documents/Projects/$(command ls ~/Documents/Projects/ | tofi --width=320 --height=200)' --wraps='set selected_project (command ls ~/Documents/Projects/ | tofi --width=320 --height=200); test -n "$selected_project"; and alacritty -e nvim ~/Documents/Projects/"$selected_project"' --description 'alias open-project-dmenu=set selected_project (command ls ~/Documents/Projects/ | tofi --width=320 --height=200); test -n "$selected_project"; and alacritty -e nvim ~/Documents/Projects/"$selected_project"'
  set selected_project (command ls ~/Documents/Projects/ | tofi --width=320 --height=200); test -n "$selected_project"; and alacritty -e nvim ~/Documents/Projects/"$selected_project" $argv
        
end