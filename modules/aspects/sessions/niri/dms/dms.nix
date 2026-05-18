{ inputs, ... }:
{
  flake-file.inputs = {
    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms-plugin-registry = {
      url = "github:AvengeMedia/dms-plugin-registry";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.aspects.niri = {
    homeManager =
      { config, ... }:
      {
        imports = [
          inputs.dms.homeModules.dank-material-shell
          inputs.dms.homeModules.niri
          inputs.dms-plugin-registry.modules.default
        ];

        programs.dank-material-shell = {
          enable = true;

          enableSystemMonitoring = true;
          enableDynamicTheming = true;
          enableAudioWavelength = true;
          enableCalendarEvents = true;
          enableClipboardPaste = true;

          /*
            # Currently throws an error i can't debug
            systemd = {
              enable = true;             # Systemd service for auto-start
              restartIfChanged = true;   # Auto-restart dms.service when dank-material-shell changes
            };
          */

          settings = {
            theme = "dark";
            dynamicTheming = true;

            currentThemeName = "dynamic";
            currentThemeCategory = "dynamic";
            matugenScheme = "scheme-rainbow";

            blurEnabled = true;
            blurForegroundLayers = true;
            blurLayerOutlineOpacity = 0.12;
            blurBorderColor = "outline";
            blurBorderCustomColor = "#ffffff";
            blurBorderOpacity = 0.35;

            iconTheme = "System Default";
            cursorSettings.theme = "System Default";

            # Add any other settings here
            # (https://raw.githubusercontent.com/AvengeMedia/DankMaterialShell/refs/heads/master/quickshell/Common/settings/SettingsSpec.js)
          };

          session = {
            isLightMode = false;
            wallpaperPath = "${config.home.homeDirectory}/nixos-config/resources/wallpapers/rosepine_wallpaper_1.png";
            # Add any other session state settings here
            # https://raw.githubusercontent.com/AvengeMedia/DankMaterialShell/refs/heads/master/quickshell/Common/settings/SessionSpec.js
          };

          niri = {
            enableSpawn = true;
            includes = {
              enable = true;
              override = true;
              originalFileName = "hm";
              filesToInclude = [
                "alttab"
                "binds"
                "colors"
                "cursor"
                "layout"
                "outputs"
                "wpblur"
              ];
            };
          };

          plugins = {
            mediaPlayer = {
              enable = true;
              settings = {
                preferredSource = "spotify";
              };
            };
          };
        };
      };
  };
}
