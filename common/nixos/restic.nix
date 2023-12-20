{...}: {
  services.restic.backups = {
    backups = {
      user = "gwg313";
      repository = "/backups";
      initialize = true;
      passwordFile = "/home/gwg313/restic.txt";
      paths = ["/home/gwg313/Projects" "/home/gwg313/Documents" "/home/gwg313/.local/share/password-store" "/home/gwg313/.local/share/buku"];
      timerConfig = {
        onCalendar = "saturday 23:00";
      };
    };
  };
}
