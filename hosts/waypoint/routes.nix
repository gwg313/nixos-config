{
  imports = [
    ./services.nix
  ];
  services.traefik = {
    dynamicConfigOptions = {
      http = {
        routers = {

          music = {
            entryPoints = [ "websecure" ];
            rule = "Host(`music.gwg313.xyz`)";
            service = "music_local";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };

          recipes = {
            entryPoints = [ "websecure" ];
            rule = "Host(`recipes.gwg313.xyz`)";
            service = "recipes_local";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };

          audiobooks = {
            entryPoints = [ "websecure" ];
            rule = "Host(`audiobooks.gwg313.xyz`)";
            service = "audiobooks_local";
            tls.certResolver = "le";
            middlewares = [ ];
          };
          scholarsome = {
            entryPoints = [ "websecure" ];
            rule = "Host(`scholarsome.gwg313.xyz`)";
            service = "scholarsome_local";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };

          bookmarks = {
            entryPoints = [ "websecure" ];
            rule = "Host(`bookmarks.gwg313.xyz`)";
            service = "bookmarks_local";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };

          pastebin = {
            entryPoints = [ "websecure" ];
            rule = "Host(`pastebin.gwg313.xyz`)";
            service = "pastebin_local";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };

          snippets = {
            entryPoints = [ "websecure" ];
            rule = "Host(`snippets.gwg313.xyz`)";
            service = "snippets_local";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };

          git = {
            entryPoints = [ "websecure" ];
            rule = "Host(`git.gwg313.xyz`)";
            service = "git_local";
            tls.certResolver = "le";
            middlewares = [ "headers" ];
          };

        };
      };
    };
  };

}
