{...}: {
  programs.nixvim = {
    plugins.marks = {
      enable = true;
    };
  };
}