{...}: {
  programs.nixvim = {
    autoCmd = [
      # Remove trailing whitespace on save
      {
        event = "BufWrite";
        command = "%s/\\s\\+$//e";
      }

      {
        event = "FileType";
        pattern = [
          "tex"
          "latex"
          "markdown"
        ];
        command = "setlocal spell spelllang=en_us";
      }

      {
        event = "FileType";
        pattern = [
          "tex"
          "latex"
          "markdown"
        ];
        command = "setlocal wrap";
      }
    ];
  };
}
