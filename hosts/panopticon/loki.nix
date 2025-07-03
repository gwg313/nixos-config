{
  services.loki = {
    enable = true;
    configFile = ./loki-config.yaml;
  };
}
