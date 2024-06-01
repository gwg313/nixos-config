{pkgs, ...}: {
  imports = [
    ./discord
    ./zathura.nix
  ];

  programs.discord = {
    enable = true;
    wrapDiscord = true;
  };

  home.packages = with pkgs; [
    betterdiscordctl # A utility for managing BetterDiscord, enhancing features and customization in the Discord desktop client.
    element-desktop # A feature-rich client for Matrix.org
    gimp # GNU Image Manipulation Program, a powerful and open-source raster graphics editor for tasks like photo editing and graphic design.
    gparted # Gnome Partition Editor, a graphical partition manager for creating, resizing, and managing disk partitions.
    kicad # An open-source electronic design automation (EDA) suite for creating schematics, PCB layouts, and 3D models.
    kodi # An open-source media center, providing a versatile platform for streaming and organizing media content.
    pavucontrol # PulseAudio Volume Control, a feature-rich GUI for controlling and configuring the PulseAudio sound system.
    #sublime-music # A modern and feature-rich music player with a clean user interface and advanced playback options.
    thunderbird # Mozilla Thunderbird, a powerful and customizable email client with integrated calendaring and chat features.
    wireshark # Open-source network protocol analyzer for real-time packet inspection and analysis.
    nicotine-plus
    anki
  ];
}
