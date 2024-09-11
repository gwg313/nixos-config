{
  config,
  lib,
  ...
}: {
  options = {
    bluetooth.enable = lib.mkEnableOption "Enables Bluetooth";
  };

  config = lib.mkIf config.bluetooth.enable {
    services.blueman.enable = true;
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    services.upower = {
      enable = true;
    };
  };
}
