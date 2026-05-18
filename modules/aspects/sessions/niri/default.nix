{ inputs, ... }:
{
  flake-file.inputs = {
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.aspects.niri = {
    nixos =
      { pkgs, ... }:
      {
        imports = [
          inputs.niri.nixosModules.niri
        ];

        programs.niri = {
          enable = true;
          package = pkgs.niri;
        };

        systemd.user.services.niri-flake-polkit.enable = false;

        services.gvfs.enable = true; # Required for trash functionality and mounting
        services.udisks2.enable = true; # Required for disk mounting

        xdg.portal = {
          enable = true;
          extraPortals = [
            pkgs.xdg-desktop-portal-gtk
          ];
          config.common.default = [
            "gnome"
            "gtk"
          ];
        };

        environment.systemPackages = with pkgs; [
          xwayland-satellite
        ];
      };

    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          alacritty
          gnome-text-editor
          libreoffice
          loupe
          nautilus
          nautilus-open-any-terminal
          xdg-utils
        ];
      };
  };
}
