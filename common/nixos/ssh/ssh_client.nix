{
  config,
  lib,
  ...
}: {
  options = {
    ssh_client.enable = lib.mkEnableOption "enable ssh client settings";
  };
  config = lib.mkIf config.ssh_client.enable {
    programs.ssh = {
      # disable unnecessary forwardings
      forwardX11 = false;

      # explicitly define cryptography algorithms to avoid the use of weak algorithms
      # AES CTR modes have been removed to mitigate the Terrapin attack
      # https://terrapin-attack.com/
      ciphers = [
        "aes256-gcm@openssh.com"
        "aes128-gcm@openssh.com"
      ];
      hostKeyAlgorithms = [
        "ssh-ed25519"
        "ssh-ed25519-cert-v01@openssh.com"
        "sk-ssh-ed25519@openssh.com"
        "sk-ssh-ed25519-cert-v01@openssh.com"
        "rsa-sha2-256"
        "rsa-sha2-256-cert-v01@openssh.com"
        "rsa-sha2-512"
        "rsa-sha2-512-cert-v01@openssh.com"
      ];
      macs = [
        "hmac-sha2-256-etm@openssh.com"
        "hmac-sha2-512-etm@openssh.com"
        "umac-128-etm@openssh.com"
      ];
      kexAlgorithms = [
        "sntrup761x25519-sha512@openssh.com"
        "curve25519-sha256"
        "curve25519-sha256@libssh.org"
        "diffie-hellman-group16-sha512"
        "diffie-hellman-group18-sha512"
      ];
      extraConfig = "
      # disable unnecessary forwardings
      ForwardAgent no
      ForwardX11Trusted no
      GatewayPorts no
      Tunnel no

      # disable unnecessary authentication methods
      ChallengeResponseAuthentication no
      GSSAPIAuthentication no
      HostbasedAuthentication no

      # define authentication methods to be used
      PasswordAuthentication yes
      PubkeyAuthentication yes
      PreferredAuthentications publickey,password

      # disable pre-connection compression as it could cause security issues
      Compression no

      # in addition to checking a host's hostname, also check the host's IP address
      # this provides extra safety against DNS spoofing attacks
      CheckHostIP yes

      # ask the user if the user wants to accept the new host's host key
      StrictHostKeyChecking ask

      # hash the entries in the known_hosts file to prevent disclosure
      # of the file's content
      HashKnownHosts yes

      # send a keepalive message to the server when the session has been idle for 60 seconds
      # this prevents/detects connection timeouts
      ServerAliveInterval 60

      # increase the number of password retries
      NumberOfPasswordPrompts 5

      # display an ASCII art of the server's host key
      VisualHostKey yes
    ";
    };
  };
}
