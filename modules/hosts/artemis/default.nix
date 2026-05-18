{ den, ... }:
{
  den.hosts.x86_64-linux.artemis.users.gruco = { };

  den.aspects.artemis = {
    provides.to-users = {
      includes = with den.aspects; [
        base
        bluetooth
        browsing
        communication
        dev
        flatpak
        gaming
        media
        niri
        sound
        wifi
      ];
    };

    nixos =
      { pkgs, ... }:
      {
        imports = [
          # Include the results of the hardware scan.
          ./_hardware.nix
        ];

        boot = {
          plymouth.enable = true;
          loader = {
            systemd-boot = {
              enable = true;
              configurationLimit = 5;
              consoleMode = "max";
            };
            timeout = 15;
            efi.canTouchEfiVariables = true;
          };

          kernelPackages = pkgs.linuxPackages_latest;
        };

        # Configure keymap in X11
        services.xserver.xkb = {
          layout = "es";
          variant = "";
        };

        programs.nh = {
          enable = true;
        };

        # Enable CUPS to print documents.
        services.printing.enable = true;
      };
  };
}
