{ ... }:
{
  programs.nixvim = {
    plugins.lean = {
      enable = true;
      settings = {
        abbreviations.enable = false;
        lsp.enable = false;
      };
    };
  };
}
