{ inputs, den, ... }:
{
  flake-file.inputs = {
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  den.aspects.spotify = {
    includes = [
      (den.provides.unfree [
        "spotify"
      ])
    ];

    homeManager =
      { pkgs, ... }:
      {
        imports = [
          inputs.spicetify-nix.homeManagerModules.default
        ];

        programs.spicetify =
          let
            spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
          in
          {
            enable = true;

            enabledExtensions = with spicePkgs.extensions; [
              betterGenres
              fullAppDisplayMod
              wikify
            ];
            enabledCustomApps = with spicePkgs.apps; [
              lyricsPlus
              newReleases
            ];

            theme = spicePkgs.themes.sleek;
            colorScheme = "Coral";

          };
      };
  };
}
