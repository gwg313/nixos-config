# A modern replacement for 'ls'.
{...}: {
  programs.ssh = {
    enable = true;
    hashKnownHosts = true;
    matchBlocks = {
      "router" = {
        hostname = "router.local.gwg313.xyz";
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
      "bytebastion1" = {
        hostname = "bytebastion1.local.gwg313.xyz";
        user = "gwg313";
        identityFile = "/home/gwg313/.ssh/home/id_ed25519";
      };
      "bytebastion2" = {
        hostname = "bytebastion2.local.gwg313.xyz";
        user = "gwg313";
        identityFile = "/home/gwg313/.ssh/home/id_ed25519";
      };
      "bytebastion3" = {
        hostname = "bytebastion3.local.gwg313.xyz";
        user = "gwg313";
        identityFile = "/home/gwg313/.ssh/home/id_ed25519";
      };
    };
  };
}
