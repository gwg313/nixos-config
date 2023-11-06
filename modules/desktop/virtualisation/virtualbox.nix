{
  config,
  pkgs,
  user,
  ...
}: {
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = ["${user}"];
  virtualisation.virtualbox.host.enableExtensionPack = true;

  #environment = {
  #  interactiveShellInit = ''
  #    alias rtmp='docker start nginx-rtmp'
  #  '';                                                           # Alias to easily start container
  #};

  environment.systemPackages = with pkgs; [
    vagrant
  ];
}
