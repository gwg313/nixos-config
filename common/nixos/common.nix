{
  config,
  lib,
  pkgs,
  inputs,
  outputs,
  user,
  ...
}:
{
  imports = [
    ./packages.nix
    ./users.nix
    ./locale.nix
    ./documentation.nix
    ../../common/style/stylix.nix
  ];
  #
  security.sudo.extraRules = [
    {
      users = [ "gwg313" ];
      commands = [
        {
          command = "/run/current-system/sw/bin/nixos-rebuild";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];
  nixpkgs.config = {
    allowUnfree = true;
  };
  nix = {
    settings = {
      substituters = [
        "https://cache.nixos.org?priority=10"
        "https://hyprland.cachix.org"
        "https://nix-community.cachix.org"
        "https://cache.garnix.io"
        "https://numtide.cachix.org"
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
        "numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE="
      ];
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
      trusted-users = [ "${user}" ];
    };
    optimise.automatic = true;
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 14d";
    };

  };

  services = {
    fstrim.enable = true;
  };
  # Disable so comma can be installed
  programs.command-not-found.enable = false;
  programs.nix-index-database.comma.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system we e ere taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
