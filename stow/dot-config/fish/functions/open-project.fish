function open-project --wraps=command\ ls\ \~/Documents/Projects/\ \|\ fzf\ --bind\ \'enter:become:nvim\ \~/Documents/Projects/\{\}\' --description alias\ open-project=command\ ls\ \~/Documents/Projects/\ \|\ fzf\ --bind\ \'enter:become:nvim\ \~/Documents/Projects/\{\}\'
  command ls ~/Documents/Projects/ | fzf --bind 'enter:become:nvim ~/Documents/Projects/{}' $argv
        
end
