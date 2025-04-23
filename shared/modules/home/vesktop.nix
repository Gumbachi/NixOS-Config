{ ... }: {


  programs.vesktop = {
    enable = true;
    vencord.settings = {
      autoUpdate = true;
      autoUpdateNotification = false;
      useQuickCss = true;
      disableMinSize = true;
      plugins = {
        AlwaysAnimate.enabled = true;
        AlwaysTrust = {
          enabled = true;
          domain = true;
          file = true;
        };
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
        SkikiCodeblocks.enabled = true;
        TypingTweaks.enabled = true;
        Unindent.enabled = true;
        VolumeBooster.enabled = true;
        WebScreenShareFixes.enabled = true;
        WhoReacted.enabled = true;
        YoutubeAdblock.enabled = true;
      };
    };

  };



}
