{...}: {
  services.sshguard = {
    enable = true;
    services = [
      "sshd"
    ];
    blocktime = 120;
    detection_time = 1800;
    blacklist_threshold = 120;
    blacklist_file = "/var/lib/sshguard/blacklist.db";
  };
}
