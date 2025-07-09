{
  imports = [
    ./services.nix
  ];
  services.traefik = {
    dynamicConfigOptions = {
      http = {
        routers = {
          attic_local = {
            entryPoints = [ "websecure" ];
            rule = "Host(`cache.gwg313.xyz`)";
            service = "attic_local";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };
        };
      };
    };
  };
}
