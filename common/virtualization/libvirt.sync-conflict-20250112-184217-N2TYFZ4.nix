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
    boot.kernelModules = [ "kvm-amd" ];
    environment.systemPackages = with pkgs; [
      virt-manager
      # vagrant
    ];
    virtualisation.libvirtd.enable = true;
    users.extraGroups.libvirtd.members = [ "${user}" ];

    virtualisation.virtualbox.host.enable = true;
    users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];
    virtualisation.virtualbox.host.enableExtensionPack = true;
    virtualisation.virtualbox.guest.enable = true;
    virtualisation.virtualbox.guest.dragAndDrop = true;
  };
}
