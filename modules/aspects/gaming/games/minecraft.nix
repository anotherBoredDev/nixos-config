{
  den.aspects.gaming = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          prismlauncher
        ];
      };
  };
}
