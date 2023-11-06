{...}: {
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      challengeResponseAuthentication = false;
      PermitRootLogin = "no";
    };
  };
}
