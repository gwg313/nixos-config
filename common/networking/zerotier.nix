{
  config,
  lib,
  pkgs,
  inputs,
  outputs,
  ...
}:
{
  options = {
    zerotier.enable = lib.mkEnableOption "Enables zerotier and joins my network";
  };
  config = lib.mkIf config.zerotier.enable {
    services.zerotierone = {
      joinNetworks = [
        "ebe7fbd445359e9d"
      ];
      enable = true;
    };

    networking.extraHosts = ''
      192.168.194.54 graphene.zt
      192.168.191.218 candlekeep.zt
      192.168.191.201 grymforge.zt
    '';
  };
}
