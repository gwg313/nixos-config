{
  config,
  lib,
  ...
}: {
  imports = [./zerotier.nix];

  zerotier.enable = lib.mkDefault true;
}
