# A customizable prompt for shells.
{...}: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = true;
      character = {
        success_symbol = "➜";
        error_symbol = "➜";
      };
      aws = {
        disabled = true;
      };
    };
  };
}
