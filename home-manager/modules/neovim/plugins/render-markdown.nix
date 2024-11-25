{pkgs, ...}: {
  programs.nixvim = {
    plugins.render-markdown = {
      enable = true;
    };
  };

  home.packages = with pkgs; [python312Packages.pylatexenc];
}
