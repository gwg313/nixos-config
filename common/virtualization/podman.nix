{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    podman.enable = lib.mkEnableOption "Enables podman and installs container tools";
  };

  config = lib.mkIf config.podman.enable {
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
      hadolint # Dockerfile linter to analyze and enforce best practices in containerization.
      podman-compose # Podman plugin for managing multi-container applications.
      podman-tui # Text-based user interface (TUI) for Podman, facilitating container management.
      syft # Open-source tool for scanning and analyzing container images for software composition and vulnerabilities.
    ];
  };
}
