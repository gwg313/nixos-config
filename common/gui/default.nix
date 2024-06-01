{lib, ...}: {
  imports = [./thunar.nix];

  thunar.enable = lib.mkDefault true;
}
