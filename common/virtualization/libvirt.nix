{
  config,
  pkgs,
  user,
  lib,
  ...
}: {
  options = {
    libvirt.enable = lib.mkEnableOption "Enables Libvirt";
  };
  config = lib.mkIf config.libvirt.enable {
    boot.kernelModules = ["kvm-amd"];
    environment.systemPackages = with pkgs; [virt-manager];
    virtualisation.libvirtd.enable = true;
    users.extraGroups.libvirtd.members = ["${user}"];
  };
}
