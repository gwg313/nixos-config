{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [pkgs.vimPlugins.precognition-nvim];

    keymaps = [
      {
        mode = "n";
        key = "<leader>vp";
        action.__raw = ''
          function()
            if require("precognition").toggle() then
                vim.notify("precognition on")
            else
                vim.notify("precognition off")
            end
          end
        '';

        options = {
          desc = "Precognition Toggle";
          silent = true;
        };
      }
    ];
  };
}
