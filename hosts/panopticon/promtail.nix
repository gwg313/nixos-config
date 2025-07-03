{ config, ... }:
{
  systemd.tmpfiles.rules = [
    "d /var/lib/promtail 0755 promtail promtail -"
  ];
  services.promtail = {
    enable = true;
    configuration = {
      server.http_listen_port = 9080;
      server.grpc_listen_port = 0;
      positions = {
        filename = "/var/lib/promtail/positions.yaml";
      };
      clients = [
        {
          url = "http://localhost:3100/loki/api/v1/push";
        }
      ];
      scrape_configs = [
        {
          job_name = "journal";
          journal = {
            labels = {
              job = "systemd-journal";
              host = config.networking.hostName;
            };
          };
        }
      ];
    };
  };
}
