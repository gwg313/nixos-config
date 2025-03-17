{
  config,
  pkgs,
  user,
  lib,
  ...
}:
{
  options = {
    libvirt.enable = lib.mkEnableOption "Enables Libvirt";
  };
  config = lib.mkIf config.libvirt.enable {
    networking.firewall.trustedInterfaces = [ "virbr0" ];
    boot.kernelModules = [ "kvm-amd" ];
    environment.systemPackages = with pkgs; [
      virt-manager
      virtiofsd
      # vagrant
    ];

    users.users.${user} = {
      extraGroups = [
        "libvirtd"
        "qemu-libvirtd"
        "kvm"
      ];
    };
    # Allow VM to run as non-root without ulimit
    security.pam.loginLimits = [
      {
        domain = "${user}";
        type = "soft";
        item = "memlock";
        value = "20000000";
      }
      {
        domain = "${user}";
        type = "hard";
        item = "memlock";
        value = "20000000";
      }
    ];

    virtualisation.libvirtd = {
      enable = true;
      # qemu.ovmf.enable = true;
      # qemu.runAsRoot = false;
      onBoot = "ignore";
      onShutdown = "shutdown";
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
        ovmf = {
          enable = true;
          packages = [
            (pkgs.OVMF.override {
              secureBoot = true;
              tpmSupport = true;
            }).fd
          ];
        };
      };
    };

    users.extraGroups.libvirtd.members = [ "${user}" ];

    # virtualisation.virtualbox.host.enable = true;
    # users.extraGroups.vboxusers.members = [ "${user}" ];
    # virtualisation.virtualbox.host.enableExtensionPack = true;
    # virtualisation.virtualbox.guest.enable = true;
    # virtualisation.virtualbox.guest.dragAndDrop = true;
  };
}
