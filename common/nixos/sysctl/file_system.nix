{
  config,
  pkgs,
  ...
}: {
  boot.kernel.sysctl = {
    # disallow core dumping by SUID/SGID programs
    "fs.suid_dumpable" = 0;

    # protect the creation of hard links
    # one of the following conditions must be fulfilled
    #   - the user can only link to files that he or she owns
    #   - the user must first have read and write access to a file, that he/she wants to link to
    "fs.protected_hardlinks" = 1;

    # protect the creation of symbolic links
    # one of the following conditions must be fulfilled
    #   - the process following the symbolic link is the owner of the symbolic link
    #   - the owner of the directory is also the owner of the symbolic link
    "fs.protected_symlinks" = 1;

    # enable extended FIFO protection
    "fs.protected_fifos" = 2;

    # similar to protected_fifos, but it avoids writes to an attacker-controlled regular file
    "fs.protected_regular" = 2;

    # increase system file descriptor limit
    # this value can be up to:
    #   - 2147483647 (0x7fffffff) on a 32-bit system
    #   - 9223372036854775807 (0x7fffffffffffffff) on a 64-bit system
    # be aware that the Linux kernel documentation suggests that inode-max should be 3-4 times
    #   larger than this value
    "fs.file-max" = 9223372036854775807;

    # increase the amount of files that can be watched
    # each file watch handle takes 1080 bytes
    # up to 540 MiB of memory will be consumed if all 524288 handles are used
    "fs.inotify.max_user_watches" = 524288;
  };
}
