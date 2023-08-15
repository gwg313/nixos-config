{ pkgs, ... }:

{
  home.file."/home/glen/.config/lvim" = {
    source = ./lvim;
    recursive = true;
  };

  home.packages = with pkgs; [

  ];

}
