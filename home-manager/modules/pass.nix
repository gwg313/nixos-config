# ✨ Magical shell history
{pkgs, ...}: {
  programs.password-store = {
    enable = true;
  };

  home.packages = with pkgs; [
    tessen
  ];
}
