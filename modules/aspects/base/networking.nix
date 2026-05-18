{ den, ... }:
{
  den.aspects.base = {
    includes = [
      den.provides.hostname
    ];

    nixos = {
      networking = {
        networkmanager = {
          enable = true;
        };
      };

      systemd = {
        services.NetworkManager-wait-online.enable = false;
        network.wait-online.enable = false;
      };
    };
  };
}
