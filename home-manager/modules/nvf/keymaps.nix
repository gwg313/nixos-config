{
  programs.nvf.settings.vim = {
    globals.mapleader = " ";
    binds = {
      whichKey = {
        enable = true;
        # TODO: registers
        register = { };
      };
    };
    keymaps = [
      # General Mappings
      {
        key = "s";
        mode = "n";
        silent = true;
        action = "<cmd>lua require('flash').jump()<cr>";
        desc = "Flash";
      }
      {
        key = "K";
        mode = "n";
        silent = true;
        action = "<cmd>lua vim.lsp.buf.hover()<cr>";
        desc = "LSP Hover";
      }
      {
        key = "<C-tab>";
        mode = "n";
        silent = true;
        action = "<cmd>bnext<cr>";
        desc = "Next Buffer";
      }

      # Kitty navigator
      {
        key = "<C-h>";
        mode = "n";
        silent = true;
        action = "<cmd>KittyNavigateLeft<cr>";
      }
      {
        key = "<C-j>";
        mode = "n";
        silent = true;
        action = "<cmd>KittyNavigateDown<cr>";
      }
      {
        key = "<C-k>";
        mode = "n";
        silent = true;
        action = "<cmd>KittyNavigateUp<cr>";
      }
      {
        key = "<C-l>";
        mode = "n";
        silent = true;
        action = "<cmd>KittyNavigateRight<cr>";
      }

      # Disable Arrow Keys in Normal Mode
      # {
      #   key = "<Up>";
      #   mode = "n";
      #   silent = true;
      #   action = "k";
      #   desc = "Disable Up Arrow";
      # }
      # {
      #   key = "<Down>";
      #   mode = "n";
      #   silent = true;
      #   action = "j";
      #   desc = "Disable Down Arrow";
      # }
      # {
      #   key = "<Left>";
      #   mode = "n";
      #   silent = true;
      #   action = "h";
      #   desc = "Disable Left Arrow";
      # }
      # {
      #   key = "<Right>";
      #   mode = "n";
      #   silent = true;
      #   action = "l";
      #   desc = "Disable Right Arrow";
      # }

      # UI
      {
        key = "<leader>uw";
        mode = "n";
        silent = true;
        action = "<cmd>set wrap!<cr>";
        desc = "Toggle word wrapping";
      }
      {
        key = "<leader>ul";
        mode = "n";
        silent = true;
        action = "<cmd>set linebreak!<cr>";
        desc = "Toggle linebreak";
      }
      {
        key = "<leader>us";
        mode = "n";
        silent = true;
        action = "<cmd>set spell!<cr>";
        desc = "Toggle spellLazyGitcheck";
      }
      {
        key = "<leader>uc";
        mode = "n";
        silent = true;
        action = "<cmd>set cursorline!<cr>";
        desc = "Toggle cursorline";
      }
      {
        key = "<leader>un";
        mode = "n";
        silent = true;
        action = "<cmd>set number!<cr>";
        desc = "Toggle line numbers";
      }
      {
        key = "<leader>ur";
        mode = "n";
        silent = true;
        action = "<cmd>set relativenumber!<cr>";
        desc = "Toggle relative line numbers";
      }
      {
        key = "<leader>ut";
        mode = "n";
        silent = true;
        action = "<cmd>set showtabline=2<cr>";
        desc = "Show tabline";
      }
      {
        key = "<leader>uT";
        mode = "n";
        silent = true;
        action = "<cmd>set showtabline=0<cr>";
        desc = "Hide tabline";
      }

      # Windows
      {
        key = "<leader>ws";
        mode = "n";
        silent = true;
        action = "<cmd>split<cr>";
        desc = "Split";
      }
      {
        key = "<leader>wv";
        mode = "n";
        silent = true;
        action = "<cmd>vsplit<cr>";
        desc = "VSplit";
      }
      {
        key = "<leader>wd";
        mode = "n";
        silent = true;
        action = "<cmd>close<cr>";
        desc = "Close";
      }
      {
        key = "<leader>ma";
        mode = "n";
        silent = true;
        action = "<cmd>close<cr>";
        desc = "Close";
      }
      {
        key = "<C-Left>";
        mode = "n";
        silent = true;
        action = "<cmd>lua require('smart-splits').move_cursor_left()<cr>";
        desc = "Move to left split";
      }

      {
        key = "<C-Down>";
        mode = "n";
        silent = true;
        action = "<cmd>lua require('smart-splits').move_cursor_down()<cr>";
        desc = "Move to lower split";
      }
      {
        key = "<C-Up>";
        mode = "n";
        silent = true;
        action = "<cmd>lua require('smart-splits').move_cursor_up()<cr>";
        desc = "Move to upper split";
      }
      {
        key = "<C-Right>";
        mode = "n";
        silent = true;
        action = "<cmd>lua require('smart-splits').move_cursor_right()<cr>";
        desc = "Move to right split";
      }

      {
        key = "<M-Left>";
        mode = "n";
        silent = true;
        action = "<cmd>lua require('smart-splits').resize_left()<cr>";
        desc = "Resize left";
      }
      {
        key = "<M-Down>";
        mode = "n";
        silent = true;
        action = "<cmd>lua require('smart-splits').resize_down()<cr>";
        desc = "Resize down";
      }
      {
        key = "<M-Up>";
        mode = "n";
        silent = true;
        action = "<cmd>lua require('smart-splits').resize_up()<cr>";
        desc = "Resize up";
      }
      {
        key = "<M-Right>";
        mode = "n";
        silent = true;
        action = "<cmd>lua require('smart-splits').resize_right()<cr>";
        desc = "Resize right";
      }

      {
        key = "<leader>w=";
        mode = "n";
        silent = true;
        action = "<C-w>=";
        desc = "Equalize Splits";
      }
      {
        key = "<leader>we";
        mode = "n";
        silent = true;
        action = "<cmd>lua require('smart-splits').swap_buf_right()<cr>";
        desc = "Swap Buffer Right";
      }
      {
        key = "<leader>wh";
        mode = "n";
        silent = true;
        action = "<cmd>lua require('smart-splits').swap_buf_left()<cr>";
        desc = "Swap Buffer Left";
      }

      {
        key = "<C-o>";
        mode = "n";
        silent = true;
        action = "<C-o>zz";
        desc = "Jump back and center";
      }
      {
        key = "<C-i>";
        mode = "n";
        silent = true;
        action = "<C-i>zz";
        desc = "Jump forward and center";
      }
    ];
  };
}
