{
  config,
  lib,
  pkgs,
  inputs,
  outputs,
  ...
}: {
  services.zerotierone = {
    joinNetworks = [
      "ebe7fbd445359e9d"
    ];
    enable = true;
  };

  networking.extraHosts = ''
    192.168.194.241 nothing.zt
    192.168.191.213 candlekeep.zt
    192.168.191.168 grymforge.zt
  '';
}
