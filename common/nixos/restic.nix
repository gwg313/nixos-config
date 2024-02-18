{
  config,
  user,
  ...
}: {
  sops.secrets.restic_key = {
    owner = config.users.users.${user}.name;
  };

  services.restic.backups = {
    backups = {
      user = "${user}";
      repository = "/backups";
      initialize = true;
      passwordFile = "${config.sops.secrets.restic_key.path}";
      paths = ["/home/${user}/repos" "/home/${user}/Documents" "/home/${user}/.local/share/password-store" "/home/${user}/.local/share/buku"];
      timerConfig = {
        onCalendar = "saturday 23:00";
      };
    };
  };
}
