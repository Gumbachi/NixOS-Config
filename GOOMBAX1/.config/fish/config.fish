if status is-interactive
    # Commands to run in interactive sessions can go here
end

function yy
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

set fish_greeting

fish_config theme choose "mocha"

function starship_transient_prompt_func
  starship module character
end

zoxide init fish | source

starship init fish | source
enable_transience