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
    networking.wireless.environmentFile = config.sops.secrets."wireless.env".path;
    networking.wireless.networks = {
      "@home_uuid@" = {
        psk = "@home_psk@";
        priority = 99;
      };
      "@school_uuid@" = {
        auth = ''
          key_mgmt=WPA-EAP
          eap=PEAP
          phase2="auth=MSCHAPV2"
          identity="@school_identity@"
          password="@school_password@"
        '';
        priority = 89;
      };

      "eduroam" = {
        auth = ''
          key_mgmt=WPA-EAP
          eap=PEAP
          phase2="auth=MSCHAPV2"
          identity="@eduroam_identity@"
          password="@school_password@"
        '';
        priority = 79;
      };
    };
  };
}
