{lib, ...}: {
  imports = [
    ./zerotier.nix
    ./firewall.nix
  ];

  zerotier.enable = lib.mkDefault true;
  firewall.enable = lib.mkDefault true;
}
