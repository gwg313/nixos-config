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
    argocd
    k3d
    k9s
    kind
    kubectl
    kubectx
    kubernetes-helm
    minikube
    stern
  ];
}
