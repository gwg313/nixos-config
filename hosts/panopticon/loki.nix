_: {
  services.loki = {
    enable = true;
    configuration = {
      auth_enabled = false;
      server.http_listen_port = 3100;

      ingester = {
        lifecycler = {
          ring = {
            kvstore = {
              store = "inmemory";
            };
          };
          final_sleep = "0s";
        };
        chunk_idle_period = "5m";
        max_chunk_age = "1h";
        chunk_target_size = 1048576;
      };

      schema_config = {
        configs = [
          {
            from = "2024-01-01";
            store = "boltdb-shipper";
            object_store = "filesystem";
            schema = "v11";
            index = {
              prefix = "index_";
              period = "24h";
            };
          }
        ];
      };

      storage_config = {
        boltdb_shipper = {
          active_index_directory = "/var/lib/loki/index";
          cache_location = "/var/lib/loki/cache";
          shared_store = "filesystem";
        };
        filesystem = {
          directory = "/var/lib/loki/chunks";
        };
      };

      limits_config = {
        retention_period = "168h";
      };
    };
  };
}
