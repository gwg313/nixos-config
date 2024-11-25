{...}: {
  programs.nixvim = {
    plugins.mark-radar = {
      enable = true;
    };
  };
}
