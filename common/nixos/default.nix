{lib, ...}: {
  imports = [
    ./common.nix
    ./laptop.nix
    ./nfs.nix
    ./restic.nix
    ./ssh/default.nix
  ];

  laptop.enable = lib.mkDefault false;
  nfs.enable = lib.mkDefault false;
  restic.enable = lib.mkDefault true;
}
