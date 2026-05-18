{ inputs, ... }:
{
  flake-file.inputs = {
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.aspects.zen-browser = {
    homeManager =
      { pkgs, ... }:
      let
        firefox-addons = inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system};
      in
      {
        programs.zen-browser.profiles.default.extensions.packages = with firefox-addons; [
          bitwarden
          dictionary-spanish
          ublock-origin
        ];
      };
  };
}
