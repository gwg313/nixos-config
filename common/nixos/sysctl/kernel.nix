{
  config,
  pkgs,
  ...
}: {
  boot.kernel.sysctl = {
    # enable ExecShield protection
    # 2 enables ExecShield by default unless applications bits are set to disabled
    # uncomment on systems without NX/XD protections
    # check with: dmesg | grep --color '[NX|DX]*protection'
    #kernel.exec-shield = 2

    # enable ASLR
    # turn on protection and randomize stack, vdso page and mmap + randomize brk base address
    "kernel.randomize_va_space" = 2;

    # controls the System Request debugging functionality of the kernel
    "kernel.sysrq" = 0;

    # controls whether core dumps will append the PID to the core filename
    # useful for debugging multi-threaded applications
    "kernel.core_uses_pid" = 1;

    # restrict access to kernel address
    # kernel pointers printed using %pK will be replaced with 0’s regardless of privileges
    "kernel.kptr_restrict" = 2;

    # Ptrace protection using Yama
    #   - 1: only a parent process can be debugged
    #   - 2: only admins can use ptrace (CAP_SYS_PTRACE capability required)
    #   - 3: disables ptrace completely, reboot is required to re-enable ptrace
    "kernel.yama.ptrace_scope" = 3;

    # restrict kernel logs to root only
    "kernel.dmesg_restrict" = 1;

    # restrict BPF JIT compiler to root only
    "kernel.unprivileged_bpf_disabled" = 1;

    # disables kexec as it can be used to livepatch the running kernel
    "kernel.kexec_load_disabled" = 1;

    # disable unprivileged user namespaces to decrease attack surface
    "kernel.unprivileged_userns_clone" = 0;

    # disable the loading of kernel modules
    # this can be used to prevent runtime insertion of malicious modules
    # could break the system if enabled within sysctl.conf
    # consider setting this manually after system is up
    # sudo sysctl -w kernel.modules_disabled=1
    #kernel.modules_disabled = 1

    # allow for more PIDs
    # this value can be up to:
    #   - 32768 (2^15) on a 32-bit system
    #   - 4194304 (2^22) on a 64-bit system
    "kernel.pid_max" = 4194304;

    # reboot machine after kernel panic
    #kernel.panic = 10

    # restrict perf subsystem usage
    "kernel.perf_event_paranoid" = 3;
    "kernel.perf_cpu_time_max_percent" = 1;
    "kernel.perf_event_max_sample_rate" = 1;

    # prevent unprivileged attackers from loading vulnerable line disciplines with the TIOCSETD ioctl
    "dev.tty.ldisc_autoload" = 0;
  };
}
