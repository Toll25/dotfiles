if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source
set -U fish_greeting
jump shell fish | source
