{
  config,
  pkgs,
  ...
}: {
  boot.kernel.sysctl = {
    # increase the maximum length of processor input queues
    "net.core.netdev_max_backlog" = 250000;

    # enable BPF JIT hardening for all users
    # this trades off performance, but can mitigate JIT spraying
    "net.core.bpf_jit_harden" = 2;

    # increase TCP max buffer size setable using setsockopt()
    "net.core.rmem_max" = 8388608;
    "net.core.wmem_max" = 8388608;
    "net.core.rmem_default" = 8388608;
    "net.core.wmem_default" = 8388608;
    #net.core.optmem_max = 40960
  };
}
