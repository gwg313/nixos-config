{
  imports = [
    ./services.nix
  ];
  services.traefik = {
    dynamicConfigOptions = {
      http = {
        routers = {

          arcocd_local = {
            entryPoints = [ "websecure" ];
            rule = "Host(`argocd.local.gwg313.xyz`)";
            service = "argocd_local";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };
          music_local = {
            entryPoints = [ "websecure" ];
            rule = "Host(`music.local.gwg313.xyz`)";
            service = "music_local";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };

          pinchflat_local = {
            entryPoints = [ "websecure" ];
            rule = "Host(`pinchflat.local.gwg313.xyz`)";
            service = "pinchflat_local";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };

          proxmox_local = {
            entryPoints = [ "websecure" ];
            rule = "Host(`proxmox.local.gwg313.xyz`)";
            service = "proxmox_local";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };

          recipes_local = {
            entryPoints = [ "websecure" ];
            rule = "Host(`recipes.local.gwg313.xyz`)";
            service = "recipes_local";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };

          audiobooks_local = {
            entryPoints = [ "websecure" ];
            rule = "Host(`audiobooks.local.gwg313.xyz`)";
            service = "audiobooks_local";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };
          scholarsome_local = {
            entryPoints = [ "websecure" ];
            rule = "Host(`scholarsome.local.gwg313.xyz`)";
            service = "scholarsome_local";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };

        };
      };
    };
  };

}
