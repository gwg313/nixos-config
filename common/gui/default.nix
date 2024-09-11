{lib, ...}: {
  imports = [
    ./thunar.nix
    ./steam.nix
  ];

  thunar.enable = lib.mkDefault true;
  steam.enable = lib.mkDefault false;
}
