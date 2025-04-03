{
  inputs,
  ...
}:
{
  services.zerotierone = {
    joinNetworks = [
      inputs.secrets.zerotier.infra
    ];
    enable = true;
  };

  networking.extraHosts = ''
    10.147.17.246 audiobooks.zerotier.gwg313.xyz
    10.147.17.246 music.zerotier.gwg313.xyz
    10.147.17.246 recipes.zerotier.gwg313.xyz
    10.147.17.246 scholarsome.zerotier.gwg313.xyz
    10.147.17.246 bookmarks.zerotier.gwg313.xyz
    10.147.17.246 pastebin.zerotier.gwg313.xyz
    10.147.17.246 snippets.zerotier.gwg313.xyz
    10.147.17.246 git.zerotier.gwg313.xyz
  '';
}
