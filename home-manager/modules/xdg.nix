{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;

    extraPortals = with pkgs; [
      # xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
      libsForQt5.xdg-desktop-portal-kde
      lxqt.xdg-desktop-portal-lxqt
    ];
  };
}
