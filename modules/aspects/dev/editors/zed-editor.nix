{ lib, ... }:
{
  den.aspects.dev = {
    homeManager =
      { pkgs, ... }:
      {
        programs.zed-editor = {
          enable = true;
          extensions = [ "nix" ];
          userSettings = {
            auto_update = false;
            autosave = {
              after_delay.milliseconds = 1000;
            };
            base_keymap = "VSCode";
            ensure_final_newline_on_save = true;
            languages = {
              Nix = {
                language_servers = [
                  "nixd"
                  "!nil"
                ];
                formatter = {
                  external = {
                    command = "${lib.getExe pkgs.nixfmt}";
                    arguments = [
                      "--quiet"
                      "--"
                    ];
                  };
                };
              };
            };
            lsp = {
              nixd = {
                binary.path = lib.getExe pkgs.nixd;
              };
            };
            telemetry = {
              diagnostics = false;
              metrics = false;
            };
          };
        };
      };
  };
}
