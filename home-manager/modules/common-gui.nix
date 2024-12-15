{ pkgs, ... }:
{
  imports = [
    ./alacritty.nix
    ./fuzzel.nix
    ./kitty.nix
  ];

  fonts.fontconfig.enable = true;

  # Bluetooth power alerts
  services.poweralertd.enable = true;

  home.packages = with pkgs; [
    # fonts
    nerd-fonts.monaspace
    noto-fonts-cjk-sans
    rPackages.fontawesome
    ubuntu_font_family
    yt-dlp
  ];
}
