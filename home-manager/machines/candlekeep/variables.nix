{ config, ... }:
{
  imports = [ ../../../common/nixos/variables-config.nix ];

  config.var = {
    hostname = "candlekeep";
    username = "gwg313";
    configDirectory = "/home/" + config.var.username + "/.config/nixos";

    keyboardLayout = "en_US";

    location = "Ottawa";
    timeZone = "American/Toronto";
    defaultLocale = "en_US.UTF-8";

    git = {
      username = "gwg313";
      email = "gwg313@pm.me";
    };

    autoUpgrade = true;
    autoGarbageCollector = true;

    theme = import ../../../common/style/vars/candlekeep.nix;
  };
}
