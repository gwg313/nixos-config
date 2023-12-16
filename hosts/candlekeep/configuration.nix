# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  user,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    # outputs.nixosModules.example
    ../../common/nixos/common.nix
    ../../common/nixos/laptop.nix
    ../../common/networking/zerotier.nix
    ../../common/nixos/bluetooth.nix
    ../../common/gui/hyprland.nix
    ../../common/gui/thunar.nix
    ../../common/style/stylix.nix
    ../../common/virtualization/podman.nix
    ../../common/virtualization/kubernetes.nix
    ../../common/virtualization/libvirt.nix

    ./auditd.nix
    ./kernel.nix
    ./sysctl.nix
    ./earlyoom.nix

    # Or modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd
    inputs.nix-index-database.nixosModules.nix-index
    inputs.stylix.nixosModules.stylix
    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
  ];

  sops.defaultSopsFile = ../../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  # This will add each flake input as a registry
  # To make nix3 commands consistent with your flake
  nix.registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

  # This will additionally add your inputs to the system's legacy channels
  # Making legacy nix commands consistent as well, awesome!
  nix.nixPath = ["/etc/nix/path"];
  environment.etc =
    lib.mapAttrs'
    (name: value: {
      name = "nix/path/${name}";
      value.source = value.flake;
    })
    config.nix.registry;

  networking.hostName = "candlekeep";
  networking.networkmanager.enable = true;

  boot.loader.systemd-boot.enable = true;

  users.users = {
    gwg313 = {
      initialPassword = "correcthorsebatterystaple";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ/cWqqTUuLswymQVh9rKdUWgMNNtZE6PwXMNUgD8/Zx gwg313"
      ];
      extraGroups = ["wheel"];
    };
  };

  # This setups a SSH server. Very important if you're setting up a headless system.
  # Feel free to remove if you don't need it.
  services.openssh = {
    enable = true;
    settings = {
      # Forbid root login through SSH.
      PermitRootLogin = "no";
      # Use keys only. Remove if you want to SSH using password (not recommended)
      PasswordAuthentication = false;
    };
  };

  environment = {
    loginShellInit = ''
      if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
        exec Hyprland
      fi
    ''; # Will automatically open Hyprland when logged into tty1
    variables = {
      TERMINAL = "alacritty";
      EDITOR = "nvim";
      VISUAL = "nvim";
      PAGER = "moar";
    };
  };
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
