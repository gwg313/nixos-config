{
  services.earlyoom = {
    enable = true;
    freeSwapThreshold = 2;
    freeMemThreshold = 2;
    enableNotifications = true;
    extraArgs = [
      "-g"
      "--avoid '^(.Hyrpland-wrapp|alacritty|zerotier-one|.waybar-wrapped)$'"
      "--prefer '^(electron|libreoffice|gimp|Isolated Web Co)$'"
    ];
  };
}
