{
  services.traefik = {
    dynamicConfigOptions = {
      http = {
        services = {

          music_zt.loadBalancer.servers = [
            {
              url = "https://music.zerotier.gwg313.xyz";
            }
          ];

          audiobooks_zt.loadBalancer.servers = [
            {
              url = "https://audiobooks.zerotier.gwg313.xyz";
            }
          ];

          recipes_zt.loadBalancer.servers = [
            {
              url = "https://recipes.zerotier.gwg313.xyz";
            }
          ];

          bookmarks_zt.loadBalancer.servers = [
            {
              url = "https://bookmarks.zerotier.gwg313.xyz";
            }
          ];

          scholarsome_zt.loadBalancer.servers = [
            {
              url = "https://scholarsome.zerotier.gwg313.xyz";
            }
          ];
        };

        routers = {

          music_zt = {
            entryPoints = [ "websecure" ];
            rule = "Host(`music.gwg313.xyz`)";
            service = "music_zt";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };

          audiobooks_zt = {
            entryPoints = [ "websecure" ];
            rule = "Host(`audiobooks.gwg313.xyz`)";
            service = "audiobooks_zt";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };

          recipes_zt = {
            entryPoints = [ "websecure" ];
            rule = "Host(`recipes.gwg313.xyz`)";
            service = "recipes_zt";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };

          bookmarks_zt = {
            entryPoints = [ "websecure" ];
            rule = "Host(`bookmarks.gwg313.xyz`)";
            service = "bookmarks_zt";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };

          scholarsome_zt = {
            entryPoints = [ "websecure" ];
            rule = "Host(`scholarsome.gwg313.xyz`)";
            service = "scholarsome_zt";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };

        };
      };
    };
  };

}
