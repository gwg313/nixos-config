{...}: {
  programs.nixvim = {
    plugins.which-key = {
      enable = true;
      settings = {
        spec = [
          # "<leader>m" = "󱋼 Marks";
          # "<leader>t" = " Trouble";
          # "<leader>w" = " Window";
          # "<leader>d" = " Dap";
          # "<leader>n" = " Neorg";
          # "<leader>l" = "󰒋 Lsp";
        ];
      };
    };
  };
}
