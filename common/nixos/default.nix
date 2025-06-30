{ lib, pkgs, ... }:
{
  imports = [
    ./common.nix
    ./laptop.nix
    ./nfs.nix
    ./restic.nix
    ./ssh/default.nix
    ./logrotate.nix
  ];

  laptop.enable = lib.mkDefault false;
  nfs.enable = lib.mkDefault false;
  restic.enable = lib.mkDefault true;
  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };
  # flatpak override --user --socket=wayland md.obsidian.Obsidian (Must run this for obsidian to launch)
}
