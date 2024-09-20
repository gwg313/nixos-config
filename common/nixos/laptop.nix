{
  config,
  lib,
  ...
}: {
  imports = [
    ./bluetooth.nix
    ../networking/wireless.nix
  ];
  options = {
    laptop.enable = lib.mkEnableOption "Enables Laptop options";
  };

  config = lib.mkIf config.laptop.enable {
    # enable's backlight switching
    programs.light.enable = true;

    # use TLP for power management
    services.tlp.enable = true;

    bluetooth.enable = true;
    wireless.enable = true;
  };
}
