if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

fish_config theme save "Catppuccin Mocha"

zoxide init fish | source