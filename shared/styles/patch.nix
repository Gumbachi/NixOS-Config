{ config, ... }:{

  home-manager.sharedModules = [{

    # GTK Keyboard control outline fix
    stylix.targets.gtk.extraCss = ''
      * button:focus {
        box-shadow: none; outline: none;
      }

      * { outline: none; }

      scale slider {
        border: 2px solid @accent_color;
        background-color: @theme_bg_color;
      }
      
      * scale:focus {
        outline: none;
        box-shadow: none;
        border: none;
      }
    '';


    # Floorp color swap tab background and toolbar background to look better
    programs.floorp.profiles.default.userChrome = with config.lib.stylix.colors; ''
      #TabsToolbar {
        background-color: #${base00} !important;
      } 
      .tab-background:is([selected],[multiselected]) {
        background-color: #${base02} !important;
      }
    '';

    # Add a stylix youtube music theme
    xdg.configFile."YouTube Music/stylix-alt.css".text = with config.lib.stylix.colors; '' 
      html:not(.style-scope)
      {
        --ctp-base: #${base00};
        --ctp-mantle: #${base01};
        --ctp-crust: #${base01};

        --ctp-surface0: #${base02};
        --ctp-surface1: #${base03};
        --ctp-surface2: #${base04};

        --ctp-text: #${base05};
        --ctp-subtext0: #${base05};
        --ctp-subtext1: #${base05};

        --ctp-rosewater: #${base06};
        --ctp-lavender: #${base07};
        --ctp-red: #${base08};
        --ctp-peach: #${base09};
        --ctp-yellow: #${base0A};
        --ctp-green: #${base0B};
        --ctp-teal: #${base0C};
        --ctp-blue: #${base0D};
        --ctp-mauve: #${base0E};
        --ctp-flamingo: #${base0F};

        --ctp-accent: var(--ctp-blue);

        --unthemed-yet: inherit !important;

        --yt-spec-commerce-filled-hover: var(--ctp-accent) !important;
      }
    '' + builtins.readFile ../../../shared/styles/youtube-music.css;

    xdg.configFile."YouTube Music/stylix.css".text = with config.lib.stylix.colors; '' 

      html:not(.style-scope)
      { 
        --cust-ytmusic-play-nav-color: #${base01};
        --cust-ytmusic-dark-background: #${base00};
        --cust-ytmusic-dark-foreground: #${base01};
        
        --cust-ytmusic-light-text-1: #${base06};
        --cust-ytmusic-light-2: #c8a1a1;
        --cust-ytmusic-light-3: #d3bdbd;
        --cust-ytmusic-light-4: #c6a9a985;
        --cust-ytmusic-light-5: #d9b5b5;
        
        --cust-ytmusic-medium-1: #9e8b8bb8;
        --cust-ytmusic-medium-2: #d5d0d0;
        --cust-ytmusic-medium-3: #a68282;
        --cust-ytmusic-medium-4: #8d8d8d;
        --cust-ytmusic-medium-5: #4b2e2e;
        
        --cust-ytmusic-subscribe-color: #a84949;
        --cust-ytmusic-playbutton-color:#885454;
        --cust-ytmusic-tertiary-nav-button-color: #8d5d5d;
        --cust-ytmusic-nowplaying-color: #cc9d9d;
        
        --cust-ytmusic-main-text-1: #${base05};
        --cust-ytmusic-header-text-1: #ffffffc9;
        --cust-ytmusic-header-text-2: #ffffffc7; 

        --cust-ytmusic-scroll-width: 2px;

    '' + builtins.readFile ../../../shared/styles/youtube-music.css;
  }];

}
