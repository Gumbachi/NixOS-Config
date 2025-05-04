{ pkgs, ... }: {

  programs.floorp = {
    enable = true; 
    profiles.default = {
      extensions = {
        force = true;
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          bitwarden 
          darkreader
        ];
      };

      search = {
        default = "ddg";
        force = true;
      };

      settings = {
        "extensions.autoDisableScopes" = 0; # Auto enable plugins

        "browser.startup.page" = 1;
        "browser.startup.homepage" = "about:home";
        "browser.aboutwelcome.enabled" = false;
        "browser.toolbars.bookmarks.visibility" = "never";
        "browser.proton.toolbar.version" = 3;
        "browser.theme.toolbar-theme" = 0;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.search.suggest.enabled" = false; # Disable suggestions
        "browser.search.separatePrivateDefault" = false; # Use the same engine for private tabs

        # Set deafult background to disable to match color theme
        "browser.newtabpage.activity-stream.floorp.background.type" = 0;
        "browser.newtabpage.activity-stream.floorp.newtab.releasenote.hide" = true;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.showSearch" = false;
        "browser.newtabpage.pinned" = ''[
          {"url":"https://search.nixos.org/options?","label":"NixOS Search","customScreenshotURL":"https://wiki.nixos.org/nixos.png"},
          {"url":"https://home-manager-options.extranix.com/?query=&release=master","label":"HM Options"},
          {"url":"https://github.com","label":"GitHub"},
          {"url":"https://youtube.com","label":"YouTube"},
          {"url":"https://reddit.com","label":"Reddit"},
          {"url":"https://amazon.com","label":"Amazon"},
          {"url":"https://steamdb.info/","label":"SteamDB"},
          {"url":"https://www.protondb.com/","label":"ProtonDB"},
          {"url":"https://photos.gumbachi.com","label":"Immich"},
          {"url":"https://watch.gumbachi.com","label":"Jellyfin"},
          {"url":"http://192.168.69.2:8112","label":"Deluge"},
          {"url":"https://request.gumbachi.com","label":"Jellyseerr"},
          {"url":"http://192.168.69.2:9696","label":"Prowlarr"},
          {"url":"http://192.168.69.2:7878","label":"Radarr"},
          {"url":"http://192.168.69.2:8989","label":"Sonarr"},
          {"url":"http://192.168.69.2:3080","label":"Adguard"},
          {"url":"https://porkbun.com","label":"Porkbun"},
          {"url":"https://www.nexusmods.com/","label":"Nexus Mods"},
          {"url":"https://zoom.us/join","label":"Zoom"},
          {"url":"https://labsimapp.testout.com/v6_0_662/index.html/my-courses","label":"Testout"},
          {"url":"https://x1337x.cc","label":"1337x"}
        ]'';

        "browser.tabs.inTitlebar" = 0; # Disable Close button on title bar

        "floorp.browser.tabs.verticaltab" = true;
        "floorp.verticaltab.hover.enabled" = true; # Collapse vertical tabs
        "floorp.verticaltab.show.newtab.button" = false;
        "floorp.browser.user.interface" = 2; # Enable Firefox Proton UI
        "floorp.browser.sidebar.enable" = false;
        "floorp.browser.workspaces.enabled" = false;

        "extensions.formautofill.creditCards.enabled" = false;

        "services.sync.prefs.sync.floorp.browser.note.memos" = false;

      };

    };
  };

}
