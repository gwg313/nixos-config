{ pkgs, inputs, ... }:

{
  imports = [ inputs.nix-colors.homeManagerModules.default ];
  # choose a theme from here https://github.com/tinted-theming/base16-schemes/tree/main
  #colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;
  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-hard;



}
