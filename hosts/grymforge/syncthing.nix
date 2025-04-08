{
  config,
  user,
  inputs,
  ...
}:
{
  services.syncthing = {
    enable = true;
    dataDir = "/home/gwg313";
    openDefaultPorts = true;
    configDir = "/home/gwg313/.config/syncthing";
    user = "gwg313";
    group = "users";
    guiAddress = "127.0.0.1:8384";

    overrideDevices = true;
    overrideFolders = true;

    settings = {
      gui = {
        user = inputs.secrets.syncthing.gui_user;
        password = inputs.secrets.syncthing.gui_password;
      };
      devices = {
        "candlekeep" = {
          id = inputs.secrets.syncthing.candlekeep_id;
        };
      };

      folders = {
        "repos" = {
          path = "/home/gwg313/repos";
          devices = [ "candlekeep" ];
          versioning = {
            type = "staggered";
            params = {
              cleanInterval = "3600";
              maxAge = "15768000";
            };
          };
        };
        "documents" = {
          path = "/home/gwg313/Documents";
          devices = [ "candlekeep" ];
          versioning = {
            type = "staggered";
            params = {
              cleanInterval = "3600";
              maxAge = "15768000";
            };
          };
        };
        "password-store" = {
          path = "/home/gwg313/.local/share/password-store";
          devices = [ "candlekeep" ];
          versioning = {
            type = "staggered";
            params = {
              cleanInterval = "3600";
              maxAge = "15768000";
            };
          };
        };
      };
    };
  };
}
