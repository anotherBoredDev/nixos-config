{
  den.aspects.base = {
    homeManager = {
      xdg = {
        enable = true;
        mime.enable = true;
        mimeApps.enable = true;
        autostart.enable = true;

        userDirs = {
          enable = true;
          createDirectories = true;
          setSessionVariables = true;

          templates = null;
          publicShare = null;
        };
      };

      home = {
        preferXdgDirectories = true;
      };
    };
  };
}
