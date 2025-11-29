if status is-interactive
    atuin init fish --disable-up-arrow | source
    bind \e\[1\;5A _atuin_search # bind CTRL+<UP> to atuin search
    starship init fish | source
    set -U fish_greeting
    zoxide init fish | source
    bind -M insert ctrl-n down-or-search
    set ZELLIJ_AUTO_ATTACH true
    set ZELLIJ_AUTO_EXIT true
    set ZELLIJ_SESSION_NAME Default
    if not set -q ZELLIJ
        if test "$ZELLIJ_AUTO_ATTACH" = true
            zellij --layout compact attach -c
        else
            zellij --layout compact
        end

        if test "$ZELLIJ_AUTO_EXIT" = true
            kill $fish_pid
        end
    end
end
#if status is-login
#    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
#        exec Hyprland
#    end
#end
