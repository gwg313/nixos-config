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
        "candlekeep" = {
          id = "OREQCG7-JQMPCU4-HWFEQVM-7C6VYSC-A25I3PD-BYQ6RSU-7FQGDFX-SJDPGQY";
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
        "obsidian" = {
          path = "/home/gwg313/vault";
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
