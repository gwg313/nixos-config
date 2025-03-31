{
  services = {
    cloudflared = {
      enable = true;
      tunnels = {
        "4d40bf21-d8ef-4a71-8fb7-e4f24bb8b0cf" = {
          credentialsFile = "/home/gwg313/.cloudflared/4d40bf21-d8ef-4a71-8fb7-e4f24bb8b0cf.json";
          default = "http_status:404";
          ingress = {
            "*.gwg313.xyz" = {
              service = "http://localhost";
              # path = "/*.(jpg|png|css|js)";
            };
          };
        };
      };
    };
  };
}
