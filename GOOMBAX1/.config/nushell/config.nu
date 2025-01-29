$env.config.buffer_editor = 'nvim'
$env.config.show_banner = false

alias lsa = ls -a
alias lsl = ls -l

alias edit = nvim $env.CONFIG
alias rebuild = sudo nixos-rebuild switch
alias rebuild-boot = sudo nixos-rebuild boot
# alias rebuild-update = cd $env.CONFIG; nix flake update; nixos-rebuild switch
# alias rebuild-update-boot = cd $env.CONFIG; nix flake update; nixos-rebuild boot
# alias rebuild-clean = nix-collect-garbage -d; nixos-rebuild switch

alias sshs1 = ssh jared@192.168.69.1
alias sshs2 = ssh jared@192.168.69.2


##### STARSHIP CONFIG #####

$env.STARSHIP_SHELL = "nu"

def create_left_prompt [] {
    starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
}

# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = { || create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = ""

# The prompt indicators are environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR = ""
$env.PROMPT_INDICATOR_VI_INSERT = ": "
$env.PROMPT_INDICATOR_VI_NORMAL = "〉"
$env.PROMPT_MULTILINE_INDICATOR = "::: "

##### ZOXIDE CONFIG #####
source ~/.zoxide.nu
