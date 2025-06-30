{ lib, ... }:
{
  programs.nvf.settings.vim = {
    theme = lib.mkForce {
      enable = true;
      name = "catppuccin";
      style = "latte";
      transparent = false;
    };
    navigation = {
      harpoon.enable = true;
    };
    utility = {
      motion.flash-nvim.enable = true;
      outline.aerial-nvim.enable = true;
      diffview-nvim.enable = true;
      surround.enable = true;
      smart-splits.enable = true;
      yanky-nvim.enable = true;
    };
    tabline.nvimBufferline.enable = true;
    notes.todo-comments.enable = true;
    assistant.copilot = {
      enable = true;
      cmp.enable = true;
    };
    statusline.lualine.enable = true;
    autocomplete.blink-cmp = {
      enable = true;
      friendly-snippets.enable = true;
    };
    snippets.luasnip.enable = true;
    ui = {
      noice.enable = true;
      colorizer.enable = true;
    };
    visuals = {
      cinnamon-nvim.enable = true;
    };
    git = {
      enable = true;
      gitsigns.enable = true;
    };
    terminal.toggleterm = {
      enable = true;
      lazygit = {
        enable = true;
        mappings.open = "<leader>gl";
      };
    };
    formatter.conform-nvim.enable = true;
    binds.hardtime-nvim.enable = true;
    utility.motion.precognition.enable = true;
    binds.hardtime-nvim.setupOpts = {
      max_count = 3; # Optional: limit of consecutive presses
      disabled_keys = {
        "<Up>" = false;
        "<Down>" = false;
        "<Left>" = false;
        "<Right>" = false;
      };
      restricted_keys = {
        "<Up>" = [
          "n"
          "x"
        ];
        "<Down>" = [
          "n"
          "x"
        ];
        "<Left>" = [
          "n"
          "x"
        ];
        "<Right>" = [
          "n"
          "x"
        ];
      };
    };
  };
}
