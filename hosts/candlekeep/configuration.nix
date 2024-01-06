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
    #../../common/networking/zerotier.nix
    ../../common/nixos/bluetooth.nix
    ../../common/nixos/restic.nix
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
    inputs.sops-nix.nixosModules.sops
    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-b13379b3-2025-4d55-a40a-c0f3ad8ec801".device = "/dev/disk/by-uuid/b13379b3-2025-4d55-a40a-c0f3ad8ec801";

  sops.defaultSopsFile = ../../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  sops.age.keyFile = "/home/${user}/.config/sops/age/keys.txt";
  sops.secrets.restic_key = {
    owner = config.users.users.${user}.name;
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

  networking.hostName = "candlekeep";
  networking.networkmanager.enable = true;

  users.users = {
    gwg313 = {
      initialPassword = "correcthorsebatterystaple";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILq54YrM3BbhBs0oDLOrc1bkg6FCCmkV4E3pWLZp0ejN gwg313@pm.m"
      ];
      extraGroups = ["wheel"];
    };
  };

  # This setups a SSH server. Very important if you're setting up a headless system.
  # Feel free to remove if you don't need it.
  services.openssh = {
    enable = true;
    settings = {
      ########## Features ##########

      # disallow ssh-agent forwarding to prevent lateral movement
      AllowAgentForwarding = false;

      # prevent TCP ports from being forwarded over SSH tunnels
      # **please be aware that disabling TCP forwarding does not prevent port forwarding**
      # any user with an interactive login shell can spin up his/her own instance of sshd
      AllowTcpForwarding = false;

      # prevent StreamLocal (Unix-domain socket) forwarding
      AllowStreamLocalForwarding = false;

      # disables all forwarding features
      # overrides all other forwarding switches
      DisableForwarding = true;

      # disallow remote hosts from connecting to forwarded ports
      # i.e. forwarded ports are forced to bind to 127.0.0.1 instad of 0.0.0.0
      GatewayPorts = "no";

      # prevent tun device forwarding
      PermitTunnel = false;

      # suppress MOTD
      PrintMotd = false;

      # disable X11 forwarding since it is not necessary
      X11Forwarding = false;

      ########## Authentication ##########

      AllowUsers = ["${user}"];

      # Use keys only. Remove if you want to SSH using password (not recommended)
      PasswordAuthentication = false;
      HostbasedAuthentication = false;

      # enable pubkey authentication
      PubkeyAuthentication = true;

      # Forbid root login through SSH.
      PermitRootLogin = "no";

      # nix enables pam by default
      #UsePam = true;

      ########## Cryptography ##########

      # explicitly define cryptography algorithms to avoid the use of weak algorithms
      # AES CTR modes have been removed to mitigate the Terrapin attack
      #   https://terrapin-attack.com/

      Ciphers = ["aes256-gcm@openssh.com" "aes128-gcm@openssh.com"];
      Macs = ["hmac-sha2-256-etm@openssh.com" "hmac-sha2-512-etm@openssh.com" "umac-128-etm@openssh.com"];
      KexAlgorithms = ["curve25519-sha256" "curve25519-sha256@libssh.org" "diffie-hellman-group16-sha512" "diffie-hellman-group18-sha512"];

      ########## Connection Preferences ##########

      # enforce SSH server to only use SSH protocol version 2
      # SSHv1 contains security issues and should be avoided at all costs
      # SSHv1 is disabled by default after OpenSSH 7.0, but this option is
      #   specified anyways to ensure this configuration file's compatibility
      #   with older versions of OpenSSH server
      Protocol = 2;

      # number of client alive messages sent without client responding
      ClientAliveCountMax = 2;

      # send a keepalive message to the client when the session has been idle for 300 seconds
      # this prevents/detects connection timeouts
      ClientAliveInterval = 300;

      # compression before encryption might cause security issues
      Compression = false;

      # prevent SSH trust relationships from allowing lateral movements
      IgnoreRhosts = true;

      # log verbosely for addtional information
      LogLevel = "VERBOSE";

      # allow a maximum of two multiplexed sessions over a single TCP connection
      MaxSessions = 2;
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
