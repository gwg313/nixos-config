{ ... }:
{
  programs.nixvim = {
    colorschemes.base16 = {
      enable = true;
      colorscheme = "atelier-sulphurpool-light";
      autoLoad = true;
    };
  };
}
