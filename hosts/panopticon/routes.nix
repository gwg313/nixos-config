{
  imports = [
    ./services.nix
  ];
  services.traefik = {
    dynamicConfigOptions = {
      http = {
        routers = {
          uptime_kuma_local = {
            entryPoints = [ "websecure" ];
            rule = "Host(`uptime.gwg313.xyz`)";
            service = "uptime_kuma_local";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };

          grafana_local = {
            entryPoints = [ "websecure" ];
            rule = "Host(`grafana.gwg313.xyz`)";
            service = "grafana_local";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };

          loki_local = {
            entryPoints = [ "websecure" ];
            rule = "Host(`loki.gwg313.xyz`)";
            service = "loki_local";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };
        };
      };
    };
  };
}
