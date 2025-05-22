{ pkgs, config, ... }: {

  # TODO: Conditional import this
  home.packages = with pkgs.fishPlugins; [
    transient-fish
    sponge
  ];

  # enable integrations
  home.shell.enableFishIntegration = true;

  programs.fish = {
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

}
