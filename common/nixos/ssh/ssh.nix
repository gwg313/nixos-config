{
  config,
  lib,
  user,
  ...
}: {
  options = {
    ssh.enable = lib.mkEnableOption "enable ssh settings";
  };
  config = lib.mkIf config.ssh.enable {
    # https://www.ssh-audit.com/hardening_guides.html
    # https://github.com/jtesta/ssh-audit
    services.openssh = {
      enable = true;
      settings = {
        ########## Features ##########

        # disallow ssh-agent forwarding to prevent lateral movement
        AllowAgentForwarding = false;

        # prevent TCP ports from being forwarded over SSH tunnels
        # **please be aware that disabling TCP forwarding does not prevent port forwarding**
        # any user with an interactive login shell can spin up his/her own instance of sshd
        AllowTcpForwarding = false;

        # prevent StreamLocal (Unix-domain socket) forwarding
        AllowStreamLocalForwarding = false;

        # disables all forwarding features
        # overrides all other forwarding switches
        DisableForwarding = true;

        # disallow remote hosts from connecting to forwarded ports
        # i.e. forwarded ports are forced to bind to 127.0.0.1 instad of 0.0.0.0
        GatewayPorts = "no";

        # prevent tun device forwarding
        PermitTunnel = false;

        # suppress MOTD
        PrintMotd = false;

        # disable X11 forwarding since it is not necessary
        X11Forwarding = false;

        ########## Authentication ##########

        AllowUsers = ["${user}"];

        # Use keys only. Remove if you want to SSH using password (not recommended)
        PasswordAuthentication = false;
        HostbasedAuthentication = false;

        # enable pubkey authentication
        PubkeyAuthentication = true;

        # Forbid root login through SSH.
        PermitRootLogin = "no";

        # nix enables pam by default
        # UsePAM = false;

        # challenge-response authentication backend it not configured by default
        # therefore, it is set to "no" by default to avoid the use of an unconfigured backend
        ChallengeResponseAuthentication = false;

        # set maximum authentication retries to prevent brute force attacks
        MaxAuthTries = 3;

        # disallow connecting using empty passwords
        PermitEmptyPasswords = false;

        ########## Cryptography ##########

        # explicitly define cryptography algorithms to avoid the use of weak algorithms
        # AES CTR modes have been removed to mitigate the Terrapin attack
        #   https://terrapin-attack.com/

        Ciphers = [
          "aes256-gcm@openssh.com"
          "aes128-gcm@openssh.com"
        ];
        Macs = [
          "hmac-sha2-256-etm@openssh.com"
          "hmac-sha2-512-etm@openssh.com"
          "umac-128-etm@openssh.com"
        ];
        KexAlgorithms = [
          "sntrup761x25519-sha512@openssh.com"
          "curve25519-sha256"
          "curve25519-sha256@libssh.org"
          "diffie-hellman-group16-sha512"
          "diffie-hellman-group18-sha512"
        ];

        # hostKeyAlgorithms = [
        #   "rsa-sha2-512"
        #   "rsa-sha2-256"
        #   "ssh-ed25519"
        # ];

        ########## Connection Preferences ##########

        # enforce SSH server to only use SSH protocol version 2
        # SSHv1 contains security issues and should be avoided at all costs
        # SSHv1 is disabled by default after OpenSSH 7.0, but this option is
        #   specified anyways to ensure this configuration file's compatibility
        #   with older versions of OpenSSH server
        Protocol = 2;

        # number of client alive messages sent without client responding
        ClientAliveCountMax = 2;

        # send a keepalive message to the client when the session has been idle for 300 seconds
        # this prevents/detects connection timeouts
        ClientAliveInterval = 300;

        # compression before encryption might cause security issues
        Compression = false;

        # prevent SSH trust relationships from allowing lateral movements
        IgnoreRhosts = true;

        # log verbosely for addtional information
        LogLevel = "VERBOSE";

        # allow a maximum of two multiplexed sessions over a single TCP connection
        MaxSessions = 2;

        # let ClientAliveInterval handle keepalive
        TCPKeepAlive = false;

        # disable reverse DNS lookups
        # UseDNS = false;
      };
      extraConfig = ''
        ########## Features ##########

        # accept locale-related environment variables
        AcceptEnv LANG LC_CTYPE LC_NUMERIC LC_TIME LC_COLLATE LC_MONETARY LC_MESSAGES
        AcceptEnv LC_PAPER LC_NAME LC_ADDRESS LC_TELEPHONE LC_MEASUREMENT
        AcceptEnv LC_IDENTIFICATION LC_ALL LANGUAGE
        AcceptEnv XMODIFIERS

        ########## Connection Preferences ##########
        # disable reverse DNS lookups
        UseDNS no
      '';
    };
  };
}
