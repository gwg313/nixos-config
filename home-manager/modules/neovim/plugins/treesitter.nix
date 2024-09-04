{...}: {
  programs.nixvim = {
    plugins = {
      treesitter = {
        enable = true;
        nixvimInjections = true;

        settings = {
          indent.enable = true;
          highlight.enable = true;
          incremental_selection.enable = true;
        };
      };

      treesitter-context = {
        enable = false;
      };

      treesitter-refactor = {
        enable = true;
        highlightDefinitions.enable = true;
      };
      hmts.enable = true;
    };
  };
}
