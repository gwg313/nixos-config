{...}: {
  programs.nixvim = {
    plugins = {
      treesitter = {
        enable = true;
        nixvimInjections = true;

        settings = {
          indent.enable = true;
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
