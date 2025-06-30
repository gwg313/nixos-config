{ }:
{
  services.krb5 = {
    enable = true;
    defaultRealm = "LOCAL.GWG313.XYZ";
    realms."LOCAL.GWG313.XYZ" = {
      kdc = [ "kerby.local.gwg313.xyz" ];
      adminServer = "kerby.local.gwg313.xyz";
    };
  };
}
