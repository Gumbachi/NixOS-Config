{ ... }: {


  programs.vesktop = {
    enable = true;
    settings = {
      enableMenu = true;
      disableMinSize = true;
      minimizeToTray = true;
      tray = true;
      hardwareAcceleration = true;
    };
    vencord.settings = {
      enabledThemes = [ "stylix.theme.css" ];
      autoUpdate = true;
      autoUpdateNotification = false;
      useQuickCss = true;
      disableMinSize = true;
      plugins = {
        AlwaysTrust.enabled = true;
        ClearURLs.enabled = true;
        CopyFileContents.enabled = true;
        CrashHandler.enabled = true;
        FixYoutubeEmbeds.enabled = true;
        FakeNitro.enabled = true;
        LoadingQuotes.enabled = true;
        MentionAvatars.enabled = true;
        NoF1.enabled = true;
        NoOnboardingDelay.enabled = true;
        RoleColorEverywhere.enabled = true;
        ShowTimeoutDuration.enabled = true;
        TypingTweaks.enabled = true;
        Unindent.enabled = true;
        VolumeBooster.enabled = true;
        WebScreenShareFixes.enabled = true;
        WhoReacted.enabled = true;
        YoutubeAdblock.enabled = true;
        ShikiCodeblocks.enabled = true;
      };
    };

  };

}
