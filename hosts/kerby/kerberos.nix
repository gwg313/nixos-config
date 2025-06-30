{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.krb5kdc = {
    enable = true;
    realms = {
      "EXAMPLE.LOCAL" = {
        aclFile = "/etc/krb5kdc/kadm5.acl";
        dictFile = "/etc/krb5kdc/kadm5.dict";
        databaseName = "/var/lib/krb5kdc/principal";
        adminServer = "kerberos.example.local";
        supportedEnctypes = [ "aes256-cts-hmac-sha1-96" ];
      };
    };
  };

  services.kadmind.enable = true;

  services.krb5 = {
    enable = true;
    libdefaults = {
      default_realm = "EXAMPLE.LOCAL";
    };
    realms = {
      "EXAMPLE.LOCAL" = {
        kdc = [ "kerberos.example.local" ];
        admin_server = "kerberos.example.local";
      };
    };
  };

  environment.etc."krb5kdc/kadm5.acl".text = "*/admin@EXAMPLE.LOCAL *";

  sops.secrets."kdc/master_password" = { };
  sops.secrets."kdc/admin_password" = { };

  systemd.services.krb5-bootstrap = {
    description = "Bootstrap KDC DB + principals";
    wantedBy = [ "multi-user.target" ];
    before = [ "krb5kdc.service" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
            set -e
            DB="/var/lib/krb5kdc/principal"
            if [ ! -f "$DB" ]; then
              MASTER_PW=$(<${config.sops.secrets."kdc/master_password".path})
              ADMIN_PW=$(<${config.sops.secrets."kdc/admin_password".path})

              echo "Creating KDC database..."
              echo "$MASTER_PW" | kdb5_util create -s -P "$MASTER_PW"

              echo "$ADMIN_PW
      $ADMIN_PW" | kadmin.local -q "addprinc root/admin"

              kadmin.local -q "addprinc -randkey nfs/truenas.example.local"
              kadmin.local -q "ktadd -k /etc/krb5kdc/nfs.keytab nfs/truenas.example.local"
            fi
    '';
  };

  environment.etc."krb5kdc/nfs.keytab".source = "/etc/krb5kdc/nfs.keytab";
}
