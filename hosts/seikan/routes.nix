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

          pastebin_zt.loadBalancer.servers = [
            {
              url = "https://pastebin.zerotier.gwg313.xyz";
            }
          ];

          snippets_zt.loadBalancer.servers = [
            {
              url = "https://snippets.zerotier.gwg313.xyz";
            }
          ];

          git_zt.loadBalancer.servers = [
            {
              url = "https://git.zerotier.gwg313.xyz";
            }
          ];

          registry_zt.loadBalancer.servers = [
            {
              url = "https://registry.zerotier.gwg313.xyz";
            }
          ];

          ci_zt.loadBalancer.servers = [
            {
              url = "https://ci.zerotier.gwg313.xyz";
            }
          ];

          s3_zt.loadBalancer.servers = [
            {
              url = "https://s3.zerotier.gwg313.xyz";
            }
          ];

          s3_console_zt.loadBalancer.servers = [
            {
              url = "https://s3-console.zerotier.gwg313.xyz";
            }
          ];

          uptime_zt.loadBalancer.servers = [
            {
              url = "https://uptime.zerotier.gwg313.xyz";
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

          pastebin_zt = {
            entryPoints = [ "websecure" ];
            rule = "Host(`pastebin.gwg313.xyz`)";
            service = "pastebin_zt";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };
          snippets_zt = {
            entryPoints = [ "websecure" ];
            rule = "Host(`snippets.gwg313.xyz`)";
            service = "snippets_zt";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };

          git_zt = {
            entryPoints = [ "websecure" ];
            rule = "Host(`git.gwg313.xyz`)";
            service = "git_zt";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };

          ci_zt = {
            entryPoints = [ "websecure" ];
            rule = "Host(`ci.gwg313.xyz`)";
            service = "ci_zt";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };

          registry_zt = {
            entryPoints = [ "websecure" ];
            rule = "Host(`registry.gwg313.xyz`)";
            service = "registry_zt";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };

          s3_zt = {
            entryPoints = [ "websecure" ];
            rule = "Host(`s3.gwg313.xyz`)";
            service = "s3_zt";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };

          s3_console = {
            entryPoints = [ "websecure" ];
            rule = "Host(`s3-console.gwg313.xyz`)";
            service = "s3_console_zt";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };

          uptime_console = {
            entryPoints = [ "websecure" ];
            rule = "Host(`uptime.gwg313.xyz`)";
            service = "s3_console_zt";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };
        };
      };
    };
  };
}
