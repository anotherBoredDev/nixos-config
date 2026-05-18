{
  den.aspects.base = {
    nixos = {
      nix = {
        gc = {
          automatic = true;
          dates = "weekly";
          options = "--delete-older-than 14d";
        };
        settings = {
          use-xdg-base-directories = true;
          auto-optimise-store = true;
          experimental-features = [
            "nix-command"
            "flakes"
          ];
        };
      };
    };
  };
}
