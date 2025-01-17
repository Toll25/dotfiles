# config.nu
#
# Installed by:
# version = "0.101.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.
source ~/.config/nushell/zoxide.nu
source ~/.config/nushell/catppuccin_mocha.nu

let fish_completer = {|spans|
    fish --command $'complete "--do-complete=($spans | str join " ")"'
    | from tsv --flexible --noheaders --no-infer
    | rename value description
}
$env.config = {
    completions: {
        external: {
            enable: true
            completer: $fish_completer
        }
    }
}
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
alias ll = ls -l
alias lla = ls -la
alias la = ls -a
alias cat = bat -p
alias beisen = sh -i -c 'source .venv/bin/activate ; nu'
alias venv = python -m venv .venv
alias gc = git clone
alias notes = nvim ~/Documents/Notes/
alias n = notes
alias y = z
alias grep = rg
alias main = python main.py
alias yain = yay -S
alias yarm = yay -R
alias tree = tree -C
alias tree = tree -Ca
alias nvim-config = nvim ~/.dotfiles/stow/dot-config/nvim/
alias fzfrg = fzf --disabled --ansi --bind 'start:reload:rg --column --color=always --smart-case {q} || :' --bind 'change:reload:rg --column --color=always --smart-case {q} || :' --bind 'enter:become:nvim {1} +{2}' --bind 'ctrl-o:execute:nvim {1} +{2}' --delimiter ':' --preview 'bat --style=full --color=always --highlight-line {2} {1}' --preview-window '~4,+{2}+4/3,<80(up)'
