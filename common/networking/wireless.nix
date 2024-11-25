{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    wireless.enable = lib.mkEnableOption "Enables Wifi and adds my networks";
  };
  config = lib.mkIf config.wireless.enable {
    sops.secrets."wireless.env" = {};
    networking.wireless.enable = true;
    environment.systemPackages = with pkgs; [wpa_supplicant_gui];
    networking.wireless.userControlled.enable = true;
    networking.wireless.secretsFile = config.sops.secrets."wireless.env".path;
    networking.wireless.networks = {
      "Tycho Station" = {
        pskRaw = "ext:home_psk";
        priority = 99;
      };
      "CU-Wireless" = {
        auth = ''
          key_mgmt=WPA-EAP
          eap=PEAP
          phase2="auth=MSCHAPV2"
          identity="glengoodwin"
          password=ext:school_password
        '';
        priority = 89;
      };

      "eduroam" = {
        auth = ''
          key_mgmt=WPA-EAP
          eap=PEAP
          phase2="auth=MSCHAPV2"
          identity="ext:eduroam_identity"
          password="ext:school_password"
        '';
        priority = 79;
      };
    };
  };
}
