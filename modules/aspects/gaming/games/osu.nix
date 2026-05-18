{ den, ... }:
{
  den.aspects.gaming = {
    includes = [
      (den.provides.unfree [
        "osu-lazer-bin"
      ])
    ];
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          osu-lazer-bin
        ];
      };
  };
}
