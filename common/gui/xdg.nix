{
  config,
  lib,
  pkgs,
  ...
}:
{
  # XDG Portals
  xdg = {
    autostart.enable = true;
    portal = {
      enable = true;
      wlr.enable = true;
      xdgOpenUsePortal = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-hyprland
        pkgs.xdg-desktop-portal-gtk
        pkgs.libsForQt5.xdg-desktop-portal-kde
        pkgs.lxqt.xdg-desktop-portal-lxqt
      ];
    };
  };
  environment.systemPackages = with pkgs; [
    xdg-utils
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
  ];

  environment.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
  };
}
