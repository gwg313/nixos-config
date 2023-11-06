let
  user1 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAxZoOukLwiPP4tFZ2IzI61ZQccSwudPYYPJuU3COTAf";
  users = [user1];

  system1 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP9LR3o//JjFpnJ5+MSJVmTTC3x47Ca8ckL8tDRtHJZv";
  systems = [system1];
in {
  #"secret1.age".publicKeys = [ user1 system1 ];
  "env.age".publicKeys = users ++ systems;
}
