{ inputs, ... }:
{
  flake-file.inputs = {
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.7.0";
  };

  den.aspects.flatpak = {
    nixos = {
      imports = [
        inputs.nix-flatpak.nixosModules.nix-flatpak
      ];

      services.flatpak = {
        enable = true;
        remotes = [
          {
            name = "flathub";
            location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
          }
        ];
        uninstallUnmanaged = true;
        update.auto = {
          enable = true;
          onCalendar = "weekly";
        };
      };
    };
  };
}
