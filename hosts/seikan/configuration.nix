# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  modulesPath,
  lib,
  inputs,
  ...
}:

let
  ## Pin the latest NixOS stable (nixos-24.05) release:
  nixpkgs-src = builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/797f7dc49e0bc7fab4b57c021cdf68f595e47841.tar.gz";
    sha256 = "sha256:0q96nxw7jg9l9zlpa3wkma5xzmgkdnnajapwhgb2fk2ll224rgs1";
  };
in
{
  # sops
  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/gwg313/.config/sops/age/keys.txt";
  };
  imports = lib.optional (builtins.pathExists ./do-userdata.nix) ./do-userdata.nix ++ [
    (modulesPath + "/virtualisation/digital-ocean-config.nix")

    ./traefik.nix
    ./zerotier.nix
    ../../common/nixos/ssh/default.nix
    inputs.sops-nix.nixosModules.sops
  ];

  ssh.enable = true;
  ssh_guard.enable = true;
  ssh_client.enable = false;
  services.openssh.authorizedKeysFiles = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINvOfDSjlvegGqfUS18XwXB7SvS2n9/hGYUpKxRb9vgb gwg313@pm.me"
  ];
  services.openssh.settings = {
    PermitRootLogin = lib.mkForce "yes";

    AllowUsers = lib.mkForce [
      "gwg313"
      "root"
    ];
  };

  users.users.gwg313 = {
    isNormalUser = true;
    description = "gwg313";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINvOfDSjlvegGqfUS18XwXB7SvS2n9/hGYUpKxRb9vgb gwg313@pm.me"
    ];
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [ ];
  };

  users.users = {
    root = {
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINvOfDSjlvegGqfUS18XwXB7SvS2n9/hGYUpKxRb9vgb gwg313@pm.me"
      ];
    };
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  # Enable networking
  networking.networkmanager.enable = true;
  # Set your time zone.
  time.timeZone = "America/Toronto";
  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  # Define a user account. Don't forget to set a password with ‘passwd’.
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
  ];
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  # List services that you want to enable:
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
