{ ... }: {
  
  services = {

    fwupd.enable = true; # Automatic firmware updater

    immich = {
      enable = true;
      openFirewall = true;
      host = "192.168.68.54";
      machine-learning.enable = false;
    };

    adguardhome = {
      enable = true;
      allowDHCP = false;
      openFirewall = true;
    };

    # blocky = {
    #   enable = true;
    #   settings = {
    #     ports.dns = 53; # Port for incoming DNS Queries.
    #     upstreams.groups.default = [ 
    #       "https://one.one.one.one/dns-query" # Using Cloudflare's DNS over HTTPS server for resolving queries.
    #     ];

    #     # For initially solving DoH/DoT Requests when no system Resolver is available.
    #     bootstrapDns = {
    #       upstream = "https://one.one.one.one/dns-query";
    #       ips = [ "1.1.1.1" "1.0.0.1" ];
    #     };

    #     #Enable Blocking of certain domains.
    #     blocking = {

    #       denylists = {
    #         ads = [
    #           # "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
    #           "https://cdn.statically.io/gh/uBlockOrigin/uAssetsCDN/main/filters/filters.min.txt" 
    #           "https://ublockorigin.github.io/uAssetsCDN/filters/badware.min.txt"
    #           "https://cdn.jsdelivr.net/gh/uBlockOrigin/uAssetsCDN@main/filters/privacy.min.txt"
    #           "https://cdn.jsdelivr.net/gh/uBlockOrigin/uAssetsCDN@main/filters/quick-fixes.min.txt"
    #           "https://ublockorigin.github.io/uAssetsCDN/filters/unbreak.min.txt"
    #           "https://ublockorigin.pages.dev/thirdparties/easylist.txt"
    #           "https://cdn.statically.io/gh/uBlockOrigin/uAssetsCDN/main/thirdparties/easyprivacy.txt"
    #           "https://curbengh.github.io/malware-filter/urlhaus-filter-ag-online.txt"
    #           "https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=1&mimetype=plaintext"
    #           "https://ublockorigin.pages.dev/filters/annoyances.min.txt"
    #         ];
    #       };

    #       allowlists = {
    #         default = [
    #           "https://raw.githubusercontent.com/anudeepND/whitelist/master/domains/whitelist.txt"
    #         ];
    #       };

    #       #Configure what block categories are used
    #       clientGroupsBlock = {
    #         default = [ "ads" "default" ];
    #       };

    #     };

    #   };
    # };


  };
}
