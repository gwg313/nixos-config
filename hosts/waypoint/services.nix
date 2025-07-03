{
  services.traefik = {
    dynamicConfigOptions = {
      http = {
        services = {
          argocd_local.loadBalancer.servers = [
            {
              url = "https://10.1.10.3:30007";
            }
          ];
          music_local.loadBalancer.servers = [
            {
              url = "https://music.gwg313.xyz";
            }
          ];

          pinchflat_local.loadBalancer.servers = [
            {
              url = "http://10.1.10.3:30001";
            }
          ];

          proxmox_local.loadBalancer.servers = [
            {
              url = "https://10.1.10.2:8006";
            }
          ];

          recipes_local.loadBalancer.servers = [
            {
              url = "http://10.1.10.3:30000";
            }
          ];

          audiobooks_local.loadBalancer.servers = [
            {
              url = "https://audiobooks.gwg313.xyz";
            }
          ];

          scholarsome_local.loadBalancer.servers = [
            {
              url = "http://10.1.10.3:30123";
            }
          ];

          bookmarks_local.loadBalancer.servers = [
            {
              url = "http://10.1.10.3:30099";
            }
          ];

          pastebin_local.loadBalancer.servers = [
            {
              url = "http://10.1.10.3:32090";
            }
          ];
          snippets_local.loadBalancer.servers = [
            {
              url = "http://10.1.10.3:31111";
            }
          ];
          git_local.loadBalancer.servers = [
            {
              url = "https://git.gwg313.xyz";
            }
          ];

          registry_local.loadBalancer.servers = [
            {
              url = "https://registry.gwg313.xyz";
            }
          ];

          ci_local.loadBalancer.servers = [
            {
              url = "https://ci.gwg313.xyz";
            }
          ];

          s3_local.loadBalancer.servers = [
            {
              url = "https://s3.gwg313.xyz";
            }
          ];

          s3_console_local.loadBalancer.servers = [
            {
              url = "https://s3-console.gwg313.xyz";
            }
          ];

          uptime_local.loadBalancer.servers = [
            {
              url = "https://uptime.gwg313.xyz";
            }
          ];
        };
      };
    };
  };
}
