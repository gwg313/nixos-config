{ pkgs, ... }:

{
  imports =
    [
      ../../modules/shell/git/home.nix
      ../../modules/desktop/hyprland/home.nix
    ];

  home = {
    # Specific packages for laptop
    packages = with pkgs; [
      # Applications
      libreoffice # Office packages

      # Display
      #light                              # xorg.xbacklight not supported. Other option is just use xrandr.

      # Power Management
      #auto-cpufreq                       # Power management
      #tlp                                # Power management
    ];
  };

  #  programs = {
  #    alacritty.settings.font.size = 11;
  #  };

  services = {
    # Applets
    blueman-applet.enable = true; # Bluetooth
    network-manager-applet.enable = true; # Network
    #   cbatticon = {
    #     enable = true;
    #     criticalLevelPercent = 10;
    #     lowLevelPercent = 20;
    #     iconType = null;
    #   };
  };
}
