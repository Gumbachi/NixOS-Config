{ pkgs, config, lib, ... }:

with lib;

let
  cfg = config.terminal;
in {

  options.terminal = {

    # Tool replacements
    eza = {
      enable = mkEnableOption "Enable eza replacement for ls.";
      createFishAlias = mkEnableOption "Alias ls to eza in fish";
    };

    bat = {
      enable = mkEnableOption "Enable bat replacement for cat.";
      createFishAlias = mkEnableOption "Alias cat to bat in fish";
    };

    ripgrep = {
      enable = mkEnableOption "Enable ripgrep replacement for grep";
      createFishAlias = mkEnableOption "Alias grep to rg in fish";
    };

    fd.enable = mkEnableOption "Enable fd replacement for find";
    zoxide.enable = lib.mkEnableOption "Enable zoxide replacement for cd.";

    # Extra tools
    fastfetch.enable = lib.mkEnableOption "Enable fastfetch for system info.";
    fzf.enable = lib.mkEnableOption "Enable fzf fuzzy finding.";
    systemctl-tui.enable = lib.mkEnableOption "Enable TUI for systemctl";
    direnv.enable = lib.mkEnableOption "Enable direnv to automatically active dev shells";
    wget.enable = lib.mkEnableOption "Enable wget to make web requests";

    # Archive tools
    unar.enable = lib.mkEnableOption "Enable unar for zip archives.";
    unzip.enable = lib.mkEnableOption "Enable unzip for zip archives.";
    unrar.enable = lib.mkEnableOption "Enable unrar for rar archives.";
  };

  config = mkMerge [
    # Tool Replacements
    (mkIf cfg.eza.enable {
      environment.systemPackages = [ pkgs.eza ];
      programs.fish.shellAliases = mkIf cfg.eza.createFishAlias { 
        ls = "eza --icons --color-scale";
        lsa = "ls -a";
        lsl = "ls -l";
      };
    })

    (mkIf cfg.bat.enable {
      environment.systemPackages = [ pkgs.bat ];
      programs.fish.shellAliases = mkIf cfg.bat.createFishAlias {
        cat = "bat";
      };
    })

    (mkIf cfg.ripgrep.enable {
      environment.systemPackages = [ pkgs.ripgrep ];
      programs.fish.shellAliases = mkIf cfg.ripgrep.createFishAlias {
        grep = "rg";
      };
    })

    (lib.mkIf cfg.zoxide.enable {environment.systemPackages = [pkgs.zoxide];})
    (lib.mkIf cfg.fd.enable {environment.systemPackages = [pkgs.fd];})

    # Extra tools
    (lib.mkIf cfg.fastfetch.enable {environment.systemPackages = [pkgs.eza];})
    (lib.mkIf cfg.fzf.enable {environment.systemPackages = [pkgs.fzf];})
    (lib.mkIf cfg.systemctl-tui.enable {environment.systemPackages = [pkgs.systemctl-tui];})
    (lib.mkIf cfg.devenv.enable {environment.systemPackages = [pkgs.devenv];})
    (lib.mkIf cfg.direnv.enable {
      programs.direnv = {
        enable = true;
        silent = true;
      };
    })
    (lib.mkIf cfg.wget.enable {environment.systemPackages = [pkgs.wget];})

    (lib.mkIf cfg.unar.enable {environment.systemPackages = [pkgs.unar];})
    (lib.mkIf cfg.unzip.enable {environment.systemPackages = [pkgs.unzip];})
    (lib.mkIf cfg.unrar.enable {environment.systemPackages = [pkgs.unrar];})
  ];
}
