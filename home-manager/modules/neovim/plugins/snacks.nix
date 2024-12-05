{ ... }:
{
  programs.nixvim = {
    plugins.snacks = {
      enable = true;
      settings = {
        bigfile.enabled = true;
        bufdelete.enabled = true;
        gitbrowse.enabled = true;
        lazygit.enabled = true;
        statuscolumn = {
          enabled = true;

          folds = {
            open = true;
            git_hl = true;
          };
        };
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>gg";
        action = "<cmd>lua Snacks.lazygit()<CR>";
        options = {
          desc = "Open Lazygit";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>go";
        action = "<cmd>lua Snacks.gitbrowse()<CR>";
        options = {
          desc = "Open file in browser";
        };
      }
      {
        mode = "n";
        key = "<leader>gl";
        action = "<cmd>lua Snacks.lazygit.log()<CR>";
        options = {
          desc = "Open Lazygit Log (cwd)";
        };
      }
      {
        mode = "n";
        key = "<leader>c";
        action = ''<cmd>lua Snacks.bufdelete.delete()<cr>'';
        options = {
          desc = "Close buffer";
        };
      }
      {
        mode = "n";
        key = "<leader>bc";
        action = ''<cmd>lua Snacks.bufdelete.other()<cr>'';
        options = {
          desc = "Close all buffers but current";
        };
      }
      {
        mode = "n";
        key = "<leader>bC";
        action = ''<cmd>lua Snacks.bufdelete.all()<cr>'';
        options = {
          desc = "Close all buffers";
        };
      }
    ];
  };
}
