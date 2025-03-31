{ inputs, ... }:
{
  services.zerotierone = {
    joinNetworks = [
      inputs.secrets.zerotier.infra
    ];
    enable = true;
  };
}
