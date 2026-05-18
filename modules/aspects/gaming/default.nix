{ den, ... }:
{
  den.aspects.gaming = {
    includes = [
      (den.provides.unfree [
        "steam"
        "steam-unwrapped"
      ])
    ];

    nixos = {
      programs.steam.enable = true;
    };

    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          heroic
          eden
        ];
      };
  };
}
