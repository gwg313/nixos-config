{
  config,
  lib,
  pkgs,
  inputs,
  outputs,
  ...
}: {
  options = {
    firewall.enable = lib.mkEnableOption "Enable the Firewall";
  };
  config = lib.mkIf config.firewall.enable {
    networking.nftables.enable = true;
    networking.firewall = {
      enable = true;
    };
  };
}
