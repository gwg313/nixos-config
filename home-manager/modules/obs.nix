# A cat clone with syntax highlighting and Git integration.
{ pkgs, ... }:
{
  programs.obs-studio = {
    enable = true;

    # additional packages to add to gjs's runtime
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
      obs-vaapi # optional AMD hardware acceleration
      obs-gstreamer
      obs-vkcapture
    ];
  };

}
