{ inputs, ... }:
{
  den.aspects.niri = {
    nixos =
      { config, ... }:
      {
        imports = [
          inputs.dms.nixosModules.greeter
        ];

        programs.dank-material-shell.greeter = {
          enable = true;
          compositor.name = "niri";

          logs = {
            save = true;
            path = "/tmp/dms-greeter.log";
          };
        };
      };
  };
}
