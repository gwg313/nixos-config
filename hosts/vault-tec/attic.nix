{ config, ... }:
{
  users.users.atticd = {
    isSystemUser = true;
    group = "atticd";
  };
  users.groups.atticd = { };
  sops.secrets.attic-access-key = { };
  sops.secrets.attic-secret-key = { };
  sops.secrets.attic-jwt-secret = { };

  sops.templates."atticd.env" = {
    content = ''
      # AWS_ACCESS_KEY_ID=${config.sops.placeholder."attic-access-key"}
      # AWS_SECRET_ACCESS_KEY=${config.sops.placeholder."attic-secret-key"}
      ATTIC_SERVER_TOKEN_HS256_SECRET_BASE64=${config.sops.placeholder."attic-jwt-secret"}
    '';
    path = "/etc/atticd.env";
    owner = "atticd";
    group = "atticd";
    mode = "0400";
  };

  # Load it in systemd
  systemd.services.atticd.serviceConfig = {
    EnvironmentFile = "/etc/atticd.env";
  };
  services.atticd = {
    enable = true;

    # Replace with absolute path to your environment file
    environmentFile = "/etc/atticd.env";

    settings = {
      listen = "127.0.0.1:8080";

      jwt = { };
      storage = {
        type = "local";
        path = "/cache";
      };
      # storage = {
      #   type = "s3";
      #   region = "us-east-1";
      #   bucket = "attic-cache";
      #   endpoint = "https://s3.gwg313.xyz";
      # };

      # Data chunking
      #
      # Warning: If you change any of the values here, it will be
      # difficult to reuse existing chunks for newly-uploaded NARs
      # since the cutpoints will be different. As a result, the
      # deduplication ratio will suffer for a while after the change.
      chunking = {
        # The minimum NAR size to trigger chunking
        #
        # If 0, chunking is disabled entirely for newly-uploaded NARs.
        # If 1, all NARs are chunked.
        nar-size-threshold = 64 * 1024; # 64 KiB

        # The preferred minimum size of a chunk, in bytes
        min-size = 16 * 1024; # 16 KiB

        # The preferred average size of a chunk, in bytes
        avg-size = 64 * 1024; # 64 KiB

        # The preferred maximum size of a chunk, in bytes
        max-size = 256 * 1024; # 256 KiB
      };
    };
  };
}
