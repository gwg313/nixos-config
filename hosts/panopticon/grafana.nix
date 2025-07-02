_: {
  services.grafana = {
    enable = true;
    settings = {
      server = {
        http_addr = "127.0.0.1";
        http_port = 3000;
      };
      security = {
        admin_user = "admin";
        admin_password = "changeme";
      };
    };

    provision = {
      datasources.settings.datasources = [
        {
          name = "Loki";
          type = "loki";
          access = "proxy";
          url = "http://localhost:3100";
          isDefault = true;
        }
      ];
    };
  };
}
