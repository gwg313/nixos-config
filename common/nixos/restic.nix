{
  config,
  lib,
  user,
  ...
}:
{
  options = {
    restic.enable = lib.mkEnableOption "Enables Restic";
  };

  config = lib.mkIf config.nfs.enable {
    sops.secrets.restic_key = {
      owner = config.users.users.${user}.name;
    };

    services.restic.backups = {
      backups = {
        user = "${user}";
        repository = "/backups/grymforge";
        initialize = true;
        passwordFile = "${config.sops.secrets.restic_key.path}";
        paths = [
          "/home/${user}/repos"
          "/home/${user}/Documents"
          "/home/${user}/.local/share/password-store"
        ];
        # extraBackupArgs = [ "--exclude-file=/home/gwg313/Documents/Celsus" ];
        timerConfig = {
          OnCalendar = "23:00";
        };
      };
    };
  };
}
