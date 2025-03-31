{
  imports = [
    ./services.nix
  ];
  services.traefik = {
    dynamicConfigOptions = {
      http = {
        routers = {

          music_zerotier = {
            entryPoints = [ "websecure" ];
            rule = "Host(`music.zerotier.gwg313.xyz`)";
            service = "music_local";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };

          recipes_zerotier = {
            entryPoints = [ "websecure" ];
            rule = "Host(`recipes.zerotier.gwg313.xyz`)";
            service = "recipes_local";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };

          audiobooks_zerotier = {
            entryPoints = [ "websecure" ];
            rule = "Host(`audiobooks.zerotier.gwg313.xyz`)";
            service = "audiobooks_local";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };
          scholarsome_zerotier = {
            entryPoints = [ "websecure" ];
            rule = "Host(`scholarsome.zerotier.gwg313.xyz`)";
            service = "scholarsome_local";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };

          bookmarks_zerotier = {
            entryPoints = [ "websecure" ];
            rule = "Host(`bookmarks.zerotier.gwg313.xyz`)";
            service = "bookmarks_local";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };

        };
      };
    };
  };

}
