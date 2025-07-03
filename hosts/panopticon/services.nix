{
  services.traefik = {
    dynamicConfigOptions = {
      http = {
        services = {
          uptime_kuma_local.loadBalancer.servers = [
            {
              url = "http://127.0.0.1:3030";
            }
          ];

          grafana_local.loadBalancer.servers = [
            {
              url = "http://127.0.0.1:3001";
            }
          ];

          loki_local.loadBalancer.servers = [
            {
              url = "http://127.0.0.1:3100";
            }
          ];
        };
      };
    };
  };
}
