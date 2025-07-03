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

          pastebin_zerotier = {
            entryPoints = [ "websecure" ];
            rule = "Host(`pastebin.zerotier.gwg313.xyz`)";
            service = "pastebin_local";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };
          snippets_zerotier = {
            entryPoints = [ "websecure" ];
            rule = "Host(`snippets.zerotier.gwg313.xyz`)";
            service = "snippets_local";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };

          git_zerotier = {
            entryPoints = [ "websecure" ];
            rule = "Host(`git.zerotier.gwg313.xyz`)";
            service = "git_local";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };

          git_zt = {
            entryPoints = [ "websecure" ];
            rule = "Host(`git.zerotier.gwg313.xyz`)";
            service = "git_local";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };

          ci_zt = {
            entryPoints = [ "websecure" ];
            rule = "Host(`ci.zerotier.gwg313.xyz`)";
            service = "ci_local";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };

          registry_zt = {
            entryPoints = [ "websecure" ];
            rule = "Host(`registry.zerotier.gwg313.xyz`)";
            service = "registry_local";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };

          s3_zt = {
            entryPoints = [ "websecure" ];
            rule = "Host(`s3.zerotier.gwg313.xyz`)";
            service = "s3_local";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };

          s3_console_zt = {
            entryPoints = [ "websecure" ];
            rule = "Host(`s3-console.zerotier.gwg313.xyz`)";
            service = "s3_console_local";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };

          uptime_zt = {
            entryPoints = [ "websecure" ];
            rule = "Host(`uptime.zerotier.gwg313.xyz`)";
            service = "uptime_local";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };
        };
      };
    };
  };
}
