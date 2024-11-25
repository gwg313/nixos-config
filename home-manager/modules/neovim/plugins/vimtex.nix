{...}: {
  programs.nixvim = {
    plugins.vimtex = {
      enable = true;
      settings = {
        compiler_method = "pdflatex";
        toc_config = {
          split_pos = "vert topleft";
          split_width = 40;
        };
        view_method = "zathura";
      };
    };
  };
}
