{pkgs, ...}: {
  programs.nixvim = {
    extraConfigLuaPre = ''
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end
    '';
    plugins = {
      luasnip = {
        enable = true;
        fromVscode = [{}];

        settings = {
          enable_autosnippets = true;
          store_selection_keys = "<Tab>";
        };
      };
      friendly-snippets = {
        enable = true;
      };

      lspkind = {
        enable = true;
        mode = "symbol_text";
        cmp = {
          enable = true;
          # Custom Theme
          after = ''
            function(entry, vim_item, kind)
                local strings = vim.split(kind.kind, "%s", { trimempty = true })
                kind.kind = " " .. (strings[1] or "") .. " "
                kind.menu = "    (" .. (strings[2] or "") .. ")"
                return kind
            end
          '';
        };
      };
      cmp-nvim-lsp.enable = true;
      cmp-nvim-lua.enable = true;
      cmp_luasnip.enable = true;
      # cmp-path.enable = true;
      cmp-latex-symbols.enable = true;
      cmp-buffer.enable = true;
      cmp = {
        enable = true;
        autoEnableSources = true;

        settings = {
          experimental = {
            ghost_text = true;
          };
          sources = [
            {
              name = "nvim_lsp";
              # priority = 1000;
              # option = { };
            }

            {name = "luasnip";}

            {name = "buffer";}

            # { name = "path"; }
          ];

          mapping = {
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<Tab>" = ''
              cmp.mapping(function(fallback)
                if require("luasnip").expand_or_locally_jumpable() then
                  require("luasnip").expand_or_jump()
                elseif cmp.visible() then
                  cmp.select_next_item()
                elseif has_words_before() then
                  cmp.complete()
                else
                  fallback()
                end
              end, { "i", "s" })
            '';
            "<S-Tab>" = ''
              cmp.mapping(function(fallback)
                if require("luasnip").jumpable(-1) then
                  require("luasnip").jump(-1)
                elseif cmp.visible() then
                  cmp.select_prev_item()
                else
                  fallback()
                end
              end, { "i", "s" })
            '';
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.abort()";
            "<Up>" = "cmp.mapping.select_prev_item()";
            "<Down>" = "cmp.mapping.select_next_item()";
            "<C-p>" = "cmp.mapping.select_prev_item()";
            "<C-n>" = "cmp.mapping.select_next_item()";
            "<C-u>" = "cmp.mapping.scroll_docs(-4)";
            "<C-d>" = "cmp.mapping.scroll_docs(4)";
          };
          window = {
            documentation.max_height = "math.floor(40 * (40 / vim.o.lines))";
            completion = {
              winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None";
              col_offset = -3;
              side_padding = 0;
              border = "rounded";
            };
            documentation = {
              border = "rounded";
            };
          };

          snippet.expand = ''
            function(args)
              require('luasnip').lsp_expand(args.body)
            end
          '';

          formatting = {
            fields = [
              "kind"
              "abbr"
              "menu"
            ];
          };

          menu = {
            buffer = "";
            calc = "";
            cmdline = "";
            codeium = "󱜙";
            emoji = "󰞅";
            git = "";
            luasnip = "󰩫";
            neorg = "";
            nvim_lsp = "";
            nvim_lua = "";
            path = "";
            spell = "";
            treesitter = "󰔱";
          };
        };
      };
    };

    extraPlugins = with pkgs.vimPlugins; [vim-snippets];
    extraConfigLua = ''
      luasnip = require("luasnip")
      kind_icons = {
        Text = "󰊄",
        Method = "",
        Function = "󰡱",
        Constructor = "",
        Field = "",
        Variable = "󱀍",
        Class = "",
        Interface = "",
        Module = "󰕳",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
      }
    '';
  };
}
