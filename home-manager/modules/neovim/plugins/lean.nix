{...}: {
  programs.nixvim = {
    plugins.lean = {
      enable = true;
      lsp.enable = false;
      abbreviations.enable = false;
    };
  };
}
