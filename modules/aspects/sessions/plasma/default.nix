{ inputs, ... }:
{
  den.aspects.plasma = {
    nixos = {
      services = {
        displayManager.plasma-login-manager.enable = true;
        desktopManager.plasma6.enable = true;
      };
    };

    homeManager =
      { pkgs, ... }:
      {
        imports = [
          inputs.nix-flatpak.homeManagerModules.nix-flatpak
        ];

        home = {
          packages = with pkgs; [
            kdePackages.ark
            kdePackages.filelight
            kdePackages.gwenview
            kdePackages.kate
            kdePackages.kcalc
            kdePackages.okular
            kdePackages.plasma-browser-integration
            vlc
          ];
        };

        services.flatpak = {
          packages = [
            "com.usebottles.bottles"
          ];
        };
      };
  };
}
