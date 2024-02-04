{lib, ...}: {
  boot.kernel.sysctl = {
    # disable unprivileged user namespaces to decrease attack surface
    # Enabled because breaks discord/element etc
    "kernel.unprivileged_userns_clone" = lib.mkForce 1;
  };
}
