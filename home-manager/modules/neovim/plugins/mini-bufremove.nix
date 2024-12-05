{ ... }:
{
  programs.nixvim = {
    plugins = {
      mini = {
        enable = true;

        modules = {
          bufremove = { };
        };
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>c";
        action.__raw =
          # lua
          ''require("mini.bufremove").delete'';
        options = {
          desc = "Close buffer";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-w>";
        action.__raw =
          # lua
          ''require("mini.bufremove").delete'';
        options = {
          desc = "Close buffer";
          silent = true;
        };
      }
    ];
  };
}
