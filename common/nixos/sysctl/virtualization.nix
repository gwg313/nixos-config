{
  config,
  pkgs,
  ...
}: {
  boot.kernel.sysctl = {
    # do not allow mmap in lower addresses
    "vm.mmap_min_addr" = 65536;

    # improve mmap ASLR effectiveness
    "vm.mmap_rnd_bits" = 32;
    "vm.mmap_rnd_compat_bits" = 16;

    # prevent unprivileged users from accessing userfaultfd
    # restricts syscall to the privileged users or the CAP_SYS_PTRACE capability
    "vm.unprivileged_userfaultfd" = 0;
  };
}
