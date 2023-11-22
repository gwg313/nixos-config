# ✨ Magical shell history
{...}: {
  programs.atuin = {
    enable = true;
    flags = [
      "--disable-up-arrow"
    ];
  };
}
