{
  config,
  pkgs,
  lib,
  ...
}:
{
  networking.hostName = "nixos-iso";

  # Required dummy boot device for ISO builds
  boot.loader.grub.device = "/dev/sda";

  # Enable OpenSSH at boot
  services.openssh.enable = true;

  # Permit root login via SSH key (disable password auth)
  services.openssh.settings = {
    PermitRootLogin = "prohibit-password";
    PasswordAuthentication = false;
  };

  users.users.root = {
    initialHashedPassword = lib.mkForce "!"; # disables password login
    openssh.authorizedKeys.keys = [
      # Replace with your actual SSH public key
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINvOfDSjlvegGqfUS18XwXB7SvS2n9/hGYUpKxRb9vgb gwg313@pm.me"
    ];
  };

  # Useful base tools
  environment.systemPackages = with pkgs; [
    git
    htop
    vim
    curl
  ];
}
