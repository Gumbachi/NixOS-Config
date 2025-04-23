{pkgs, ...}: {
  environment.systemPackages = with pkgs.fishPlugins; [
    transient-fish
    sponge
  ];

  programs.fish = {
    enable = true;
    shellAliases = {
      # ls = "eza --icons --color-scale";
      # lsa = "eza --icons --color-scale -a";
      # lsl = "eza --icons --color-scale -l";

      edit = "nvim $CONFIG";
      rebuild = "sudo nixos-rebuild switch";
      rebuild-boot = "sudo nixos-rebuild boot";
      rebuild-update = "cd $CONFIG && sudo nix flake update && nixos-rebuild switch";
      rebuild-update-boot = "cd $CONFIG && sudo nix flake update && nixos-rebuild boot";
      rebuild-clean = "sudo nix-collect-garbage -d && nixos-rebuild switch";

      sshs1 = "ssh jared@192.168.69.1";
      sshs2 = "ssh jared@192.168.69.2";

      yt-dlp-audio = "yt-dlp -x --audio-format mp3 -f bestaudio -o '%(title)s.%(ext)s'";
      yt-dlp-video = "yt-dlp -f bestvideo+bestaudio -o '%(title)s.%(ext)s'";
    };

    shellAbbrs = {
      nixgc = "sudo nix-collect-garbage -d";
    };

    shellInit = ''
      set fish_greeting

      function yy
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
          cd -- "$cwd"
        end
        rm -f -- "$tmp"
      end

      zoxide init fish | source
    '';
  };
}
