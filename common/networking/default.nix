{lib, ...}: {
  imports = [
    ./zerotier.nix
    ./firewall.nix
    ./wireless.nix
  ];

  zerotier.enable = lib.mkDefault true;
  firewall.enable = lib.mkDefault true;
  wireless.enable = lib.mkDefault false;
}
