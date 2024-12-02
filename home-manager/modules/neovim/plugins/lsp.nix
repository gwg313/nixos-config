{
  lib,
  pkgs,
  ...
}: {
  programs.nixvim = {
    extraConfigLuaPre =
      # lua
      ''
        vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticError", linehl = "", numhl = "" })
        vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticWarn", linehl = "", numhl = "" })
        vim.fn.sign_define("DiagnosticSignHint", { text = " 󰌵", texthl = "DiagnosticHint", linehl = "", numhl = "" })
        vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticInfo", linehl = "", numhl = "" })
      '';
    plugins = {
      lspkind.enable = true;
      lsp-lines.enable = true;
      lsp-format.enable = false; # conform-nvim does this
      lsp = {
        enable = true;
        keymaps = {
          silent = true;
          diagnostic = {
            # Navigate in diagnostics
            "<leader>lp" = "goto_prev";
            "<leader>ln" = "goto_next";
          };

          extra = [
            {
              action.__raw =
                # lua
                ''
                  function()
                    vim.lsp.buf.format({
                      async = true,
                      range = {
                        ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
                        ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
                      }
                    })
                  end
                '';
              mode = "v";
              key = "<leader>lf";
              options = {
                desc = "Format selection";
              };
            }
          ];

          lspBuf = {
            "<leader>la" = "code_action";
            "<leader>ld" = "definition";
            "<leader>lf" = "format";
            "<leader>lD" = "references";
            "<leader>lt" = "type_definition";
            "<leader>li" = "implementation";
            "<leader>lh" = "hover";
            "<leader>lr" = "rename";
          };
        };
        servers = {
          nil-ls = {
            enable = true;
            filetypes = ["nix"];
            settings = {
              formatting = {
                command = ["${lib.getExe pkgs.nixfmt-rfc-style}"];
              };
            };
          };

          pyright.enable = true;
          hls.enable = true;
          gopls.enable = true;
          hls.installGhc = true;
          leanls.enable = true;
          texlab.enable = true;
          html.enable = true;

          cmake = {
            enable = true;
            filetypes = ["cmake"];
          };

          # ccls = {
          #   enable = true;
          #   filetypes = [
          #     "c"
          #     "cpp"
          #     "objc"
          #     "objcpp"
          #   ];
          #
          #   initOptions.compilationDatabaseDirectory = "build";
          # };
          clangd = {
            enable = true;
            filetypes = [
              "c"
              "cpp"
              "objc"
              "objcpp"
            ];
          };
        };
      };
      which-key.settings.spec = [
        {
          __unkeyed = "<leader>l";
          group = "  LSP";
        }
        {
          __unkeyed = "<leader>la";
          desc = "Code Action";
        }
        {
          __unkeyed = "<leader>ld";
          desc = "Definition";
        }
        {
          __unkeyed = "<leader>lD";
          desc = "References";
        }
        {
          __unkeyed = "<leader>lf";
          desc = "Format";
        }
        {
          __unkeyed = "<leader>lp";
          desc = "Prev";
        }
        {
          __unkeyed = "<leader>ln";
          desc = "Next";
        }
        {
          __unkeyed = "<leader>lt";
          desc = "Type Definition";
        }
        {
          __unkeyed = "<leader>li";
          desc = "Implementation";
        }
        {
          __unkeyed = "<leader>lh";
          desc = "Hover";
        }
        {
          __unkeyed = "<leader>lr";
          desc = "Rename";
        }
      ];
    };
  };
}
