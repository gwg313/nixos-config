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
      "48d6023c46b60a94"
    ];
    enable = true;
  };

  networking.extraHosts = ''
    192.168.194.241 nothing.zt
  '';
}
