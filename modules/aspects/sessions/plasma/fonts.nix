{
  den.aspects.plasma = {
    nixos = {
      fonts = {
        enableDefaultPackages = true;
      };
    };

    homeManager = {
      fonts = {
        fontconfig = {
          enable = true;
        };
      };
    };
  };
}
