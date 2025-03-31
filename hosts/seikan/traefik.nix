# Traefik
{
  config,
  ...
}:
{
  imports = [
    ./routes.nix
  ];
  sops.secrets.cf-api-token = {
    mode = "0440";
    owner = config.users.users.traefik.name;
    group = config.users.users.traefik.group;
  };

  systemd.services.traefik.environment = {
    CF_DNS_API_TOKEN_FILE = "${config.sops.secrets.cf-api-token.path}";
  };

  networking.firewall.allowedTCPPorts = [
    80
    443
  ];

  services.traefik = {
    enable = true;
    staticConfigOptions = {
      serversTransport = {
        insecureSkipVerify = true;
      };
      entryPoints = {
        web = {
          address = ":80";
          http = {
            redirections = {
              entryPoint = {
                to = "websecure";
                scheme = "https";
              };
            };
          };
        };
        websecure = {
          address = ":443";
          http = {
            tls = {
              options = "default";
            };
          };
        };
      };
      api = {
        dashboard = true;
      };
      certificatesResolvers = {
        le = {
          acme = {
            email = "glen.goodwin@protonmail.com";
            storage = "/var/lib/traefik/acme.json";
            dnsChallenge = {
              provider = "cloudflare";
              resolvers = [ "1.1.1.1:53" ];
            };
          };
        };
      };
    };
    dynamicConfigOptions = {
      http = {
        routers = {
          dashboard = {
            rule = "Host(`monitor.local.gwg313.xyz`)";
            service = "api@internal";
            middlewares = [
              # "auth"
              "headers"
            ];
            entrypoints = [ "websecure" ];
            tls = {
              certResolver = "le";
            };
          };
        };
        middlewares = {
          headers = {
            headers = {
              browserxssfilter = true;
              contenttypenosniff = true;
              customframeoptionsvalue = "SAMEORIGIN";
              forcestsheader = true;
              framedeny = true;
              sslhost = "gwg313.xyz";
              sslredirect = true;
              stsincludesubdomains = true;
              stspreload = true;
              stsseconds = "315360000";
            };
          };
        };
      };
      tls = {
        options = {
          default = {
            minVersion = "VersionTLS13";
            sniStrict = true;
            curvePreferences = [
              "CurveP521"
              "CurveP384"
            ];
          };
        };
      };
    };
  };
}
