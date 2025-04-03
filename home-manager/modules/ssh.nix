{ ... }:
{
  programs.ssh = {
    enable = true;
    hashKnownHosts = true;
    matchBlocks = {
      "router" = {
        hostname = "router.local.gwg313.xyz";
        user = "glen";
        identityFile = "/home/gwg313/.ssh/home/id_ed25519";
      };
      "github.com" = {
        hostname = "github.com";
        identityFile = "/home/gwg313/.ssh/github/id_ed25519";
      };
      "candlekeep" = {
        hostname = "candlekeep.local.gwg313.xyz";
        user = "gwg313";
        identityFile = "/home/gwg313/.ssh/home/id_ed25519";
      };
      "candlekeep.zt" = {
        hostname = "candlekeep.zt"; # added to hosts in zerotier config
        user = "gwg313";
        identityFile = "/home/gwg313/.ssh/home/id_ed25519";
      };
      "grymforge" = {
        hostname = "grymforge.local.gwg313.xyz";
        user = "gwg313";
        identityFile = "/home/gwg313/.ssh/home/id_ed25519";
      };
      "grymforge.zt" = {
        hostname = "grymforge.zt"; # added to hosts in zerotier config
        user = "gwg313";
        identityFile = "/home/gwg313/.ssh/home/id_ed25519";
      };

      "waypoint" = {
        hostname = "waypoint.local.gwg313.xyz";
        user = "root";
        identityFile = "/home/gwg313/.ssh/colmena/id_ed25519";
      };

      "seikan" = {
        hostname = "147.182.147.32";
        user = "root";
        identityFile = "/home/gwg313/.ssh/digital_ocean/id_ed25519";
      };
      "onedev.local" = {
        hostname = "git.local.gwg313.xyz";
        user = "git";
        identityFile = "/home/gwg313/.ssh/onedev/id_ed25519";
        port = 2222;
      };
      "onedev" = {
        hostname = "10.1.10.3";
        user = "git";
        identityFile = "/home/gwg313/.ssh/onedev/id_ed25519";
        port = 2222;
      };
    };
  };
}
