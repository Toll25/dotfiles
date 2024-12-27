if status is-interactive
    atuin init fish --disable-up-arrow | source
    bind \e\[1\;5A _atuin_search # bind CTRL+<UP> to atuin search
    bind \cy notes
    starship init fish | source
    set -U fish_greeting
    zoxide init fish | source
end
#if status is-login
#    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
#        exec Hyprland
#    end
#end
