{ config, pkgs, user, ... }:

{
  imports = # For now, if applying to other system, swap files
    [ (import ./hardware-configuration.nix) ] ++ # Current system hardware config @ /etc/nixos/hardware-configuration.nix
    (import ../../modules/desktop/virtualisation/default.nix) ++
    (import ../../modules/hardware/default.nix) ++
    [ (import ../../modules/desktop/hyprland/default.nix) ]; # Window Manager


  hardware.sane = {
    # Used for scanning with Xsane
    enable = true;
    extraBackends = [ pkgs.sane-airscan ];
  };

  environment = {
    systemPackages = with pkgs; [
      simple-scan
    ];
  };

  programs = {
    # No xbacklight, this is the alterantive
    dconf.enable = true;
    light.enable = true;
  };

  services = {
    tlp.enable = true; # TLP and auto-cpufreq for power management
    #logind.lidSwitch = "ignore";           # Laptop does not go to sleep when lid is closed
    auto-cpufreq.enable = true;
    blueman.enable = true;
  };

  #temporary bluetooth fix
  systemd.tmpfiles.rules = [
    "d /var/lib/bluetooth 700 root root - -"
  ];
  systemd.targets."bluetooth".after = [ "systemd-tmpfiles-setup.service" ];
}
