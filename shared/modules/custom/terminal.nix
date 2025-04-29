{ pkgs, lib, config,  ... }:
let
  inherit (lib) mkEnableOption mkIf mkMerge;
  cfg = config.terminal;
in {

  options.terminal = {
    
    dropInUpgrades.enable = mkEnableOption ''
      Shorcut options to enable all drop in replacements.
        ls => eza
        cat => bat
        cd => zoxide(z)
        grep => ripgrep(rg)
        grep => fzf
        find => fd
    '';

    # Tool replacements
    eza.enable = mkEnableOption "Enable eza replacement for ls.";
    bat.enable = mkEnableOption "Enable bat replacement for cat.";
    ripgrep.enable = mkEnableOption "Enable ripgrep replacement for grep";
    fd.enable = mkEnableOption "Enable fd replacement for find";
    zoxide.enable = mkEnableOption "Enable zoxide replacement for cd.";
    fzf.enable = mkEnableOption "Enable fzf fuzzy finding.";

    # Extra tools
    systemctl-tui.enable = mkEnableOption "Enable TUI for systemctl";
    wget.enable = mkEnableOption "Enable wget to make web requests";
    btop.enable = mkEnableOption "Enable btop system monitor.";

    # Style related programs
    ricing.enable = mkEnableOption ''
      Shorcut options to enable all style related programs.
        - fastfetch
        - cava
        - pipes
        - cbonsai
    '';
    fastfetch.enable = mkEnableOption "Enable fastfetch for system info.";
    cava.enable = mkEnableOption "Enable cava for audio visualisation.";
    pipes.enable = mkEnableOption "Enable pipes, a terminal screensave.";
    cbonsai.enable = mkEnableOption "Enable cbonsai, to grow an ascii tree.";


    # Archive tools
    unar.enable = mkEnableOption "Enable unar for zip archives.";
    unzip.enable = mkEnableOption "Enable unzip for zip archives.";
    unrar.enable = mkEnableOption "Enable unrar for rar archives.";
  };

  config = mkMerge [

    (mkIf cfg.dropInUpgrades.enable {
      terminal.eza.enable = true;
      terminal.bat.enable = true;
      terminal.zoxide.enable = true;
      terminal.ripgrep.enable = true;
      terminal.fd.enable = true;
      terminal.fzf.enable = true;
    })

    # Drop In Replacements
    (mkIf cfg.eza.enable {
      environment.systemPackages = [ pkgs.eza ];
      home-manager.sharedModules = [{
        programs.eza = {
          enable = true;
          colors = "always";
          icons = "always";
        };
      }];
    })

    (mkIf cfg.bat.enable {
      environment.systemPackages = [ pkgs.bat ];
      home-manager.sharedModules = [{ programs.bat.enable = true; }];
    })

    (mkIf cfg.ripgrep.enable {
      environment.systemPackages = [ pkgs.ripgrep ];
      home-manager.sharedModules = [{ programs.ripgrep.enable = true; }];
    })

    (mkIf cfg.zoxide.enable {
      environment.systemPackages = [pkgs.zoxide];
      home-manager.sharedModules = [{ programs.zoxide.enable = true; }];
    })

    (mkIf cfg.fd.enable {
      environment.systemPackages = [pkgs.fd];
      home-manager.sharedModules = [{ programs.fd.enable = true; }];
    })

    (mkIf cfg.fzf.enable {
      environment.systemPackages = [pkgs.fzf];
      home-manager.sharedModules = [{ programs.fzf.enable = true; }];
    })

    # Style tools
    (mkIf cfg.ricing.enable {
      terminal.fastfetch.enable = true;
      terminal.cava.enable = true;
      terminal.pipes.enable = true;
      terminal.cbonsai.enable = true;
    })

    (mkIf cfg.fastfetch.enable {
      environment.systemPackages = [pkgs.fastfetch];
      home-manager.sharedModules = [{ programs.fastfetch.enable = true; }];
    })

    (mkIf cfg.cava.enable {
      environment.systemPackages = [pkgs.cava];
      home-manager.sharedModules = [{ programs.cava.enable = true; }];
    })

    (mkIf cfg.pipes.enable {
      environment.systemPackages = [pkgs.pipes];
    })

    (mkIf cfg.cbonsai.enable {
      environment.systemPackages = [pkgs.cbonsai];
    })

    # Extra Tools
    (mkIf cfg.systemctl-tui.enable {
      environment.systemPackages = [pkgs.systemctl-tui];
    })

    (mkIf cfg.wget.enable {
      environment.systemPackages = [pkgs.wget];
    })

    (mkIf cfg.btop.enable {
      environment.systemPackages = [pkgs.btop];
      home-manager.sharedModules = [{ programs.btop.enable = true; }];
    })


    (mkIf cfg.unar.enable {environment.systemPackages = [pkgs.unar];})
    (mkIf cfg.unzip.enable {environment.systemPackages = [pkgs.unzip];})
    (mkIf cfg.unrar.enable {environment.systemPackages = [pkgs.unrar];})
  ];
}
