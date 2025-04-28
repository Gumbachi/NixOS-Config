{ pkgs, config, ... }: {

  home.packages = with pkgs.fishPlugins; [
    transient-fish
    sponge
  ];

  programs.fish = {
    enable = true;
    shellAliases = {
      edit = "$EDITOR $CONFIG";
      rebuild = "nh os switch";
      rebuild-boot = "sudo nixos-rebuild boot";

      sshs1 = "ssh jared@192.168.69.1";
      sshs2 = "ssh jared@192.168.69.2";
    };

    shellAbbrs = {
      nixgc = "sudo nix-collect-garbage -d";
    };

    shellInit = ''set fish_greeting'';
  };

  # Integrations
  programs.starship.enableFishIntegration = config.programs.starship.enable;
  programs.yazi.enableFishIntegration = config.programs.yazi.enable;
  programs.zoxide.enableFishIntegration = config.programs.zoxide.enable;

}
