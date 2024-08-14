function search-env --wraps='printenv|fzf' --description 'alias search-env=printenv|fzf'
  printenv|fzf $argv
        
end
