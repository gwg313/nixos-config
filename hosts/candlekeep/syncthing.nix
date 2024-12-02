{
  config,
  user,
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
      devices = {
        "grymforge" = {
          id = "N2TYFZ4-ODIIHIZ-UP27V4V-NYMAZNI-SIATS5S-5NTM6JX-A67HCZ5-ZB4TVQJ";
        };
      };

      folders = {
        "repos" = {
          path = "/home/gwg313/repos";
          devices = [ "grymforge" ];
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
          devices = [ "grymforge" ];
          versioning = {
            type = "staggered";
            params = {
              cleanInterval = "3600";
              maxAge = "15768000";
            };
          };
        };
        "obsidian" = {
          path = "/home/gwg313/vault";
          devices = [ "grymforge" ];
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
