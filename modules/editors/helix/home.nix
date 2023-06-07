{ pkgs, ... }:

{
  programs = {
    helix = { enable = true; };

  };

  xdg.configFile = { "helix/config.toml".source = ./config.toml; };

  home.packages = with pkgs; [
    pyright
    nil
    taplo
    yaml-language-server
    terraform-ls
    lua-language-server
    rust-analyzer
    nixfmt
    nodePackages_latest.bash-language-server
    nodePackages_latest.typescript-language-server
    python311Packages.python-lsp-server
  ];

}
