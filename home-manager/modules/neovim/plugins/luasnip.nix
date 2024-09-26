{pkgs, ...}: {
  programs.nixvim = {
    plugins.luasnip = {
      enable = true;
      settings = {
        enable_autosnippets = true;
        store_selection_keys = "<Tab>";
      };
      fromVscode = [
        {
          lazyLoad = true;
          paths = "${pkgs.vimPlugins.friendly-snippets}";
        }
      ];
      fromLua = [{paths = [../snippets];}];
    };
    extraFiles = {
      "personal/luasnip-helper-funcs.lua".text = ''
        local M = {}

        local ls = require("luasnip")
        local sn = ls.snippet_node
        local i = ls.insert_node

        function M.get_ISO_8601_date()
          return os.date("%Y-%m-%d")
        end

        function M.get_visual(args, parent)
          if (#parent.snippet.env.LS_SELECT_RAW > 0) then
            return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
          else
            return sn(nil, i(1, '''))
          end
        end

        return M
      '';
    };
  };
}
