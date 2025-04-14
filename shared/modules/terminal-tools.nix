{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.terminal;
in {
  options.terminal = {
    # Tool replacements
    eza.enable = lib.mkEnableOption "Enable eza replacement for ls.";
    bat.enable = lib.mkEnableOption "Enable bat replacement for cat.";
    zoxide.enable = lib.mkEnableOption "Enable zoxide replacement for cd.";
    fd.enable = lib.mkEnableOption "Enable fd replacement for find";
    ripgrep.enable = lib.mkEnableOption "Enable ripgrep replacement for grep";

    # Extra tools
    fastfetch.enable = lib.mkEnableOption "Enable fastfetch for system info.";
    fzf.enable = lib.mkEnableOption "Enable fzf fuzzy finding.";
    systemctl-tui.enable = lib.mkEnableOption "Enable TUI for systemctl";
    devenv.enable = lib.mkEnableOption "Enable devenv for reproducible dev shells";
    direnv.enable = lib.mkEnableOption "Enable direnv to automatically active dev shells";
    wget.enable = lib.mkEnableOption "Enable wget to make web requests";

    # Archive tools
    unar.enable = lib.mkEnableOption "Enable unar for zip archives.";
    unzip.enable = lib.mkEnableOption "Enable unzip for zip archives.";
    unrar.enable = lib.mkEnableOption "Enable unrar for rar archives.";
  };

  config = lib.mkMerge [
    # Tool Replacements
    (lib.mkIf cfg.eza.enable {environment.systemPackages = [pkgs.eza];})
    (lib.mkIf cfg.bat.enable {environment.systemPackages = [pkgs.bat];})
    (lib.mkIf cfg.zoxide.enable {environment.systemPackages = [pkgs.zoxide];})
    (lib.mkIf cfg.fd.enable {environment.systemPackages = [pkgs.fd];})
    (lib.mkIf cfg.ripgrep.enable {environment.systemPackages = [pkgs.ripgrep];})

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
