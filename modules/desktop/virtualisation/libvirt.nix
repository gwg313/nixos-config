{ config, pkgs, user, ... }:

{
  boot.kernelModules = [ "kvm-amd" ];
  environment.systemPackages = with pkgs; [ virt-manager ];
  virtualisation.libvirtd.enable = true;
  users.extraGroups.libvirtd.members = [ "${user}" ];
}

