{
  services.traefik = {
    dynamicConfigOptions = {
      http = {
        services = {
          attic_local.loadBalancer.servers = [
            {
              url = "http://127.0.0.1:8080";
            }
          ];
        };
      };
    };
  };
}
