{pkgs, ...}: {
  virtualisation = {
    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  environment.systemPackages = with pkgs; [
    buildah # Tool for building OCI (Open Container Initiative) and Docker container images.
    distrobox # Lightweight utility for running Linux distributions in containers.
    dive # A tool for exploring a Docker image, allowing inspection of layer contents.
    grype # A vulnerability scanner for container images and filesystems.
    podman-compose # Podman plugin for managing multi-container applications.
  ];
}