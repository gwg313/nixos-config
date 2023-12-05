{pkgs, ...}: {
  imports = [
    ./alacritty.nix
    ./fuzzel.nix
  ];

  fonts.fontconfig.enable = true;

  # Bluetooth power alerts
  services.poweralertd.enable = true;

  home.packages = with pkgs; [
    # fonts
    nerdfonts
    noto-fonts-cjk-sans
    rPackages.fontawesome
    ubuntu_font_family
    yt-dlp
  ];
}
