function mystow --wraps='stow --adopt -t /home/elena /home/elena/Documents/dotfiles/stow' --wraps='cd /home/elena/Documents/dotfiles/stow && stow --adopt -t /home/elena .' --description 'alias mystow=cd /home/elena/Documents/dotfiles/stow && stow --adopt -t /home/elena .'
  cd /home/elena/Documents/dotfiles/stow && stow --adopt -t /home/elena . $argv
        
end
