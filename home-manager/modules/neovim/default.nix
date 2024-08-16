# A cat clone with syntax highlighting and Git integration.
{inputs, ...}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./options.nix
    ./plugins
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    luaLoader.enable = true;

    performance = {
      combinePlugins = {
        enable = true;
        standalonePlugins = [
          "hmts.nvim"
          "nvim-treesitter"
        ];
      };
      byteCompileLua.enable = true;
    };
  };
}
