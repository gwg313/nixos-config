{ config, ... }:
{
  sops.secrets.grafana_user = {
    mode = "0440";
    owner = config.users.users.grafana.name;
    group = config.users.users.grafana.group;
  };

  sops.secrets.grafana_password = {
    mode = "0440";
    owner = config.users.users.grafana.name;
    group = config.users.users.grafana.group;
  };

  services.grafana = {
    enable = true;
    settings = {
      server = {
        http_addr = "127.0.0.1";
        http_port = 3001;
      };
      security = {
        admin_user = "${config.sops.secrets.grafana_user.path}";
        admin_password = "${config.sops.secrets.grafana_password.path}";
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
