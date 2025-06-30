{ pkgs, ... }:
let
  retroarchWithCores = (
    pkgs.retroarch.withCores (
      cores: with cores; [
        bsnes
        mgba
        quicknes
        genesis-plus-gx
      ]
    )
  );
in
{
  environment.systemPackages = [
    retroarchWithCores
  ];
}
