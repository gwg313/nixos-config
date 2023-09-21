{ config, pkgs, stdenv, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_hardened;
  boot.kernelParams = [
    # Disable slab merging to prevent heap exploitation
    "slab_nomerge"
    # Enable zeroing memory during allocation and free time
    "init_on_alloc=1"
    "init_on_free=1"
    # Randomize page allocator freelists
    "page_alloc.shuffle=1"
    # Mitigations
    "pti=on"

    "vsyscall=none"
    "debugfs=off"
    "oops=panic"

    # Enable lockdown LSM
    "lockdown=confidentiality"
  ];

}
