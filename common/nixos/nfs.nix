{
  config,
  lib,
  inputs,
  ...
}:
{
  options = {
    nfs.enable = lib.mkEnableOption "Enables NFS and sets up mounts";
  };

  config = lib.mkIf config.nfs.enable {
    fileSystems = {
      "/media" = {
        device = inputs.secrets.nfs.devices.media;
        fsType = "nfs";
        options = [
          "x-systemd.automount"
          "noauto"
          "x-systemd.after=network-online.target"
          "x-systemd.mount-timeout=90"
        ];
      };

      "/books" = {
        device = inputs.secrets.nfs.devices.books;
        fsType = "nfs";
        options = [
          "x-systemd.automount"
          "noauto"
          "x-systemd.after=network-online.target"
          "x-systemd.mount-timeout=90"
        ];
      };

      "/music" = {
        device = inputs.secrets.nfs.devices.music;
        fsType = "nfs";
        options = [
          "x-systemd.automount"
          "noauto"
          "x-systemd.after=network-online.target"
          "x-systemd.mount-timeout=90"
        ];
      };

      "/projects" = {
        device = inputs.secrets.nfs.devices.projects;
        fsType = "nfs";
        options = [
          "x-systemd.automount"
          "noauto"
          "x-systemd.after=network-online.target"
          "x-systemd.mount-timeout=90"
        ];
      };

      "/backups" = {
        device = inputs.secrets.nfs.devices.backups;
        fsType = "nfs";
        options = [
          "x-systemd.automount"
          "noauto"
          "x-systemd.after=network-online.target"
          "x-systemd.mount-timeout=90"
        ];
      };
    };
  };
}
