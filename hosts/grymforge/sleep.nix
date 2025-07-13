{ pkgs, ... }:
{
  systemd.services.sleep-schedule = {
    description = "Suspend PC at 10PM and wake at 6:30AM using rtcwake";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = pkgs.writeShellScript "sleep-schedule" ''
        WAKE_TIME=$(${pkgs.coreutils}/bin/date +%s -d "tomorrow 06:30")
        exec ${pkgs.util-linux}/bin/rtcwake -m mem -t "$WAKE_TIME"
      '';
    };
  };

  systemd.timers.sleep-schedule = {
    description = "Timer to suspend PC at 10PM daily";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "*-*-* 22:00:00";
      Persistent = true;
    };
  };

  security.sudo.extraRules = [
    {
      users = [ "root" ];
      commands = [
        {
          command = "/run/current-system/sw/bin/rtcwake";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];
}
