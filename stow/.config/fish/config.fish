if status is-interactive
    # Commands to run in interactive sessions can go here
end
#if status is-login
#    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
#        exec Hyprland
#    end
#end
starship init fish | source
set -U fish_greeting
jump shell fish | source
