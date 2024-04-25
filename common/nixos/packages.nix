{
  config,
  lib,
  pkgs,
  user,
  inputs,
  outputs,
  ...
}: {
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
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
    nh
    nix-output-monitor
    nvd
    inputs.superfile.packages.${system}.default
  ];
  environment.sessionVariables = {
    FLAKE = "/home/${user}/repos/nixos-config";
  };
}
