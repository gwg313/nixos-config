{
  config,
  pkgs,
  user,
  ...
}: {
  virtualisation = {
    docker.enable = true;
  };

  users.groups.docker.members = ["${user}"];

  #environment = {
  #  interactiveShellInit = ''
  #    alias rtmp='docker start nginx-rtmp'
  #  '';                                                           # Alias to easily start container
  #};

  environment.systemPackages = with pkgs; [
    docker-compose
    distrobox
    dive # A tool for exploring a docker image, layer contents.
    grype # A vulnerability scanner for container images and filesystems.
  ];
}
