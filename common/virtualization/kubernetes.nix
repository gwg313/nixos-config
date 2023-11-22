{
  config,
  pkgs,
  user,
  ...
}: {
  environment.systemPackages = with pkgs; [
    argocd # Declarative, GitOps continuous delivery tool for Kubernetes.
    k3d # Lightweight utility to run Kubernetes clusters using Docker.
    k9s # Kubernetes CLI to visually navigate and manage resources in clusters.
    kind # Kubernetes IN Docker: Tool for running local Kubernetes clusters using Docker container nodes.
    kubectl # Kubernetes command-line tool for interacting with clusters.
    kubectx # Switch between Kubernetes contexts and namespaces with ease.
    kubernetes-helm # Package manager for Kubernetes applications, simplifying deployment and management.
    minikube # Local Kubernetes cluster for easy testing and development.
    stern # Multi-container log tailing and streaming for Kubernetes.
  ];
}
