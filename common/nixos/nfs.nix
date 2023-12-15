{...}: {
  fileSystems = {
    "/media" = {
      device = "192.168.10.2:/mnt/tank/media";
      fsType = "nfs";
      options = ["x-systemd.automount" "noauto" "x-systemd.after=network-online.target" "x-systemd.mount-timeout=90"];
    };

    "/books" = {
      device = "192.168.10.2:/mnt/tank/books";
      fsType = "nfs";
      options = ["x-systemd.automount" "noauto" "x-systemd.after=network-online.target" "x-systemd.mount-timeout=90"];
    };

    "/music" = {
      device = "192.168.10.2:/mnt/tank/music";
      fsType = "nfs";
      options = ["x-systemd.automount" "noauto" "x-systemd.after=network-online.target" "x-systemd.mount-timeout=90"];
    };

    "/projects" = {
      device = "192.168.10.2:/mnt/tank/projects";
      fsType = "nfs";
      options = ["x-systemd.automount" "noauto" "x-systemd.after=network-online.target" "x-systemd.mount-timeout=90"];
    };

    "/backups" = {
      device = "192.168.10.2:/mnt/tank/backups";
      fsType = "nfs";
      options = ["x-systemd.automount" "noauto" "x-systemd.after=network-online.target" "x-systemd.mount-timeout=90"];
    };
  };
}
