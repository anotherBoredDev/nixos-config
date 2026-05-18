{ den, ... }:
{
  den.aspects.browsing = {
    includes = with den.aspects; [
      zen-browser
    ];
  };
}
