{ ... }:
{
  programs.nixvim = {
    plugins = {
      grug-far = {
        enable = true;
        settings = {
          cmd = "GrugFar";
        };
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>rs";
        action = "<cmd>GrugFar<CR>";
        options = {
          desc = "GrugFar toggle";
          silent = true;
        };
      }
    ];
  };
}
