{ den, ... }:
{
  den.aspects.communication = {
    includes = with den.aspects; [
      vesktop
    ];
  };
}
