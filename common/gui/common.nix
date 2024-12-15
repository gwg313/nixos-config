{ pkgs, ... }:
{
  services.printing.enable = true;

  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    gnome-themes-extra
    firefox-wayland
    librewolf
    discord
    qt5.qtwayland
    qt6.qmake
    qt6.qtwayland
    adwaita-qt
    adwaita-qt6
  ];
}
