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
    ../../common/networking/zerotier.nix
    ../../common/nixos/bluetooth.nix
    ../../common/nixos/restic.nix
    ../../common/nixos/ssh.nix
    ../../common/nixos/ssh_client.nix
    ../../common/gui/hyprland.nix
    ../../common/gui/thunar.nix
    ../../common/style/stylix.nix
    ../../common/virtualization/podman.nix
    ../../common/virtualization/kubernetes.nix
    ../../common/virtualization/libvirt.nix
    ../../common/nixos/sysctl/default.nix

    ./auditd.nix
    ./kernel.nix
    ./earlyoom.nix

    # Or modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd
    inputs.nix-index-database.nixosModules.nix-index
    inputs.stylix.nixosModules.stylix
    inputs.sops-nix.nixosModules.sops
    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    initrd.luks.devices."luks-276bd2e3-9d6d-4df6-9155-3684907b48f0".device = "/dev/disk/by-uuid/276bd2e3-9d6d-4df6-9155-3684907b48f0";
  };

  # sops
  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/${user}/.config/sops/age/keys.txt";
  };

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

  networking.hostName = "grymforge";
  networking.networkmanager.enable = true;

  users.users = {
    gwg313 = {
      initialPassword = "correcthorsebatterystaple";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILq54YrM3BbhBs0oDLOrc1bkg6FCCmkV4E3pWLZp0ejN gwg313@pm.me"
      ];
      extraGroups = ["wheel"];
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
