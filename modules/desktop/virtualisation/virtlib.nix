{ config, pkgs, user, ... }:

{

  virtualisation.libvirtd.host.enable = true;
  users.extraGroups.libvirtd.members = [ "${user}" ];

}

