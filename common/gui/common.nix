{ pkgs, ... }:
{
  services.printing.enable = true;

  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    gnome-themes-extra
    librewolf
    qt5.qtwayland
    qt6.qmake
    qt6.qtwayland
    adwaita-qt
    adwaita-qt6
  ];
}
