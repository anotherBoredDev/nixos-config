{
  den.aspects.vesktop = {
    homeManager = {
      programs.vesktop = {
        enable = true;
        settings = { };
        vencord = {
          settings = {
            autoUpdate = false;
            autoUpdateNotification = false;
            notifyAboutUpdates = false;
            useQuickCss = true;
            disableMinSize = false;
            plugins = {
              BlurNSFW.enabled = true;
              CallTimer.enabled = true;
              MessageLogger = {
                enabled = true;
                ignoreSelf = true;
                ignoreBots = true;
              };
              FakeNitro.enabled = true;
              FakeProfileThemes.enabled = true;
              GameActivityToggle.enabled = true;
              ImageZoom.enabled = true;
              PinDMs.enabled = true;
              PlatformInficators.enabled = true;
              ServerInfo.enabled = true;
              Translate.enabled = true;
              VolumeBooster.enabled = true;
              WebKeybinds.enabled = true;
              WebScreenShareFixes.enabled = true;
            };
          };
        };
      };
    };
  };
}
