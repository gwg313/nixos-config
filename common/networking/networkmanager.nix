{
  config,
  pkgs,
  ...
}:
{

  sops.secrets."wireless.env" = { };
  networking = {
    networkmanager = {
      enable = true;
      ensureProfiles = {
        environmentFiles = [ config.sops.secrets."wireless.env".path ];
        profiles = {
          home-wifi = {
            connection.id = "home-wifi";
            connection.type = "wifi";
            wifi.ssid = "$home_uuid";
            wifi-security = {
              auth-alg = "open";
              key-mgmt = "wpa-psk";
              psk = "$home_psk";
            };
          };
        };
      };
    };
  };
}
