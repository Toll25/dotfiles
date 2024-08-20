function fzfrg --wraps=fzf\ --disabled\ --ansi\ \ \ \ \ --bind\ \'start:reload:rg\ --column\ --color=always\ --smart-case\ \{q\}\ \|\|\ :\'\ \ \ \ \ --bind\ \'change:reload:rg\ --column\ --color=always\ --smart-case\ \{q\}\ \|\|\ :\'\ \ \ \ \ --bind\ \'enter:become:nvim\ \{1\}\ +\{2\}\'\ \ \ \ \ --bind\ \'ctrl-o:execute:nvim\ \{1\}\ +\{2\}\'\ \ \ \ \ --delimiter\ \':\'\ \ \ \ \ --preview\ \'bat\ --style=full\ --color=always\ --highlight-line\ \{2\}\ \{1\}\'\ \ \ \ \ --preview-window\ \'\~4,+\{2\}+4/3,\<80\(up\)\' --description alias\ fzfrg=fzf\ --disabled\ --ansi\ \ \ \ \ --bind\ \'start:reload:rg\ --column\ --color=always\ --smart-case\ \{q\}\ \|\|\ :\'\ \ \ \ \ --bind\ \'change:reload:rg\ --column\ --color=always\ --smart-case\ \{q\}\ \|\|\ :\'\ \ \ \ \ --bind\ \'enter:become:nvim\ \{1\}\ +\{2\}\'\ \ \ \ \ --bind\ \'ctrl-o:execute:nvim\ \{1\}\ +\{2\}\'\ \ \ \ \ --delimiter\ \':\'\ \ \ \ \ --preview\ \'bat\ --style=full\ --color=always\ --highlight-line\ \{2\}\ \{1\}\'\ \ \ \ \ --preview-window\ \'\~4,+\{2\}+4/3,\<80\(up\)\'
  fzf --disabled --ansi     --bind 'start:reload:rg --column --color=always --smart-case {q} || :'     --bind 'change:reload:rg --column --color=always --smart-case {q} || :'     --bind 'enter:become:nvim {1} +{2}'     --bind 'ctrl-o:execute:nvim {1} +{2}'     --delimiter ':'     --preview 'bat --style=full --color=always --highlight-line {2} {1}'     --preview-window '~4,+{2}+4/3,<80(up)' $argv
        
end