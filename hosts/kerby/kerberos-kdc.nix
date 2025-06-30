{ }:
{
  services.kerberoskdc = {
    enable = true;
    realm = "LOCAL.GWG313.XYZ";
    databaseFile = "/var/lib/krb5kdc/principal";
    adminServer.enable = true;
    kadmindPort = 749;
    kdcPort = 88;
    extraConfig = ''
      max_life = 10h
      max_renewable_life = 7d
    '';
  };
}
