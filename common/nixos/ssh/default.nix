{lib, ...}: {
  imports = [./ssh.nix ./ssh_client.nix ./ssh_guard.nix];

  ssh_client.enable = lib.mkDefault true;
  ssh.enable = lib.mkDefault false;
  ssh_guard.enable = lib.mkDefault false;
}
