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
              url = "http://10.1.10.3:30033";
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
              url = "http://10.1.10.3:30080";
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
              url = "http://10.1.10.3:32221";
            }
          ];
        };

      };
    };
  };
}
