{ den, ... }:
{
  den.aspects.media = {
    includes = with den.aspects; [
      spotify
    ];
  };
}
