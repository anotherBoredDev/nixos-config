{
  den.aspects.niri = {
    nixos =
      { pkgs, ... }:
      {
        fonts = {
          enableDefaultPackages = true;
          packages = with pkgs; [
            noto-fonts
            noto-fonts-cjk-sans
            noto-fonts-color-emoji
          ];
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
