{
  atticCacheName ? "mycache",
  cacheURLs ? [
    "http://attic.lan:8080"
    "http://attic.zt:8080"
  ],
}:
{
  nix.settings = {
    substituters = map (url: "${url}/${atticCacheName}") cacheURLs;
    trusted-public-keys = [
      "${atticCacheName}:AbCdEfGhIjKlMnOpQrStUvWxYz1234567890="
    ];
  };
}
