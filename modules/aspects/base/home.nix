{
  den.aspects.base = {
    nixos = {
      home-manager = {
        useUserPackages = true;
        useGlobalPkgs = true;
        backupFileExtension = "hm-backup";
        backupCommand = "rm";
      };
    };

    homeManager = {
      programs.home-manager.enable = true;
      systemd.user.startServices = "sd-switch";
    };
  };
}
