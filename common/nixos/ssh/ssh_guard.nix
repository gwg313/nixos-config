{
  config,
  lib,
  ...
}: {
  options = {
    ssh_guard.enable = lib.mkEnableOption "enable ssh guard";
  };
  config = lib.mkIf config.ssh_guard.enable {
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
  };
}
