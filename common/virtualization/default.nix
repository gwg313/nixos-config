{
  config,
  pkgs,
  user,
  lib,
  ...
}:
{
  imports = [
    ./libvirt.nix
    ./podman.nix
    ./kubernetes.nix
  ];

  libvirt.enable = lib.mkDefault true;
  podman.enable = lib.mkDefault true;
  kubernetes.enable = lib.mkDefault true;
}
