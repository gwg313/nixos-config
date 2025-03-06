{
  config,
  pkgs,
  ...
}:
{

  environment.systemPackages = with pkgs; [ linuxKernel.packages.linux_5_4.wireguard ];

  sops.secrets."wireless.env" = { };
  networking = {
    networkmanager = {
      enable = true;
      wifi.scanRandMacAddress = true;
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
            connection.autoconnect-priority = 100;
          };
          eduroam = {
            connection.id = "eduroam";
            connection.type = "wifi";
            wifi.ssid = "eduroam";
            wifi-security = {
              key-mgmt = "wpa-eap";
            };
            "802-1x" = {
              eap = "peap;";
              identity = "$eduroam_identity";
              password = "$school_password";
              phase2-auth = "mschapv2";
            };
            connection.autoconnect = true;
            connection.autoconnect-priority = 80;
            wifi.powersave = 2;
            wifi.mode = "infrastructure";
            ipv4.method = "auto";
            # ipv4.dns = "8.8.8.8,8.8.4.4.";
            # ipv6.dns = "2001:4860:4860::8888";
            # wifi.mac-address-randomization = "random";
            ipv4.dhcp-send-hostname = false;
            # ipv4.dhcp-hostname = "NoName";
            # connection.metered = "yes";
          };

          school = {
            connection.id = "School";
            connection.type = "wifi";
            wifi.ssid = "$school_uuid";
            wifi-security = {
              key-mgmt = "wpa-eap";
            };
            "802-1x" = {
              eap = "peap;";
              identity = "$school_identity";
              password = "$school_password";
              phase2-auth = "mschapv2";
            };
            connection.autoconnect = true;
            connection.autoconnect-priority = 90;
            wifi.powersave = 2;
            wifi.mode = "infrastructure";
            ipv4.method = "auto";
            # ipv4.dns = "8.8.8.8,8.8.4.4.";
            # ipv6.dns = "2001:4860:4860::8888";
            # wifi.mac-address-randomization = "random";
            ipv4.dhcp-send-hostname = false;
            # ipv4.dhcp-hostname = "NoName";
            # connection.metered = "yes";
          };
        };
      };
    };
  };
}
