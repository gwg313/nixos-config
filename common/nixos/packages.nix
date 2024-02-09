{
  config,
  lib,
  pkgs,
  inputs,
  outputs,
  ...
}: {
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    settings = {
      default-cache-ttl = 34560000; # I only want to enter the password on boot
      maximum-cache-ttl = 34560000;
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    alejandra
    sops
    just
    vim
    wget
    home-manager
    git
  ];
}
