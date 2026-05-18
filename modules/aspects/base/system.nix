let
  stateVersion = "25.11";
in
{
  den.aspects.base = {
    nixos = {
      system = {
        inherit stateVersion;
      };
    };

    homeManager = {
      home = {
        inherit stateVersion;
      };
    };
  };
}
