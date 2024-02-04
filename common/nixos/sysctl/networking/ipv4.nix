{
  config,
  pkgs,
  ...
}: {
  boot.kernel.sysctl = {
    # enable BBR congestion control
    "net.ipv4.tcp_congestion_control" = "bbr";

    # disallow IPv4 packet forwarding
    "net.ipv4.ip_forward" = 0;

    # enable SYN cookies for SYN flooding protection
    "net.ipv4.tcp_syncookies" = 1;

    # number of times SYNACKs for a passive TCP connection attempt will be retransmitted
    "net.ipv4.tcp_synack_retries" = 5;

    # do not send redirects
    "net.ipv4.conf.default.send_redirects" = 0;
    "net.ipv4.conf.all.send_redirects" = 0;

    # do not accept packets with SRR option
    "net.ipv4.conf.default.accept_source_route" = 0;
    "net.ipv4.conf.all.accept_source_route" = 0;

    # enable reverse path source validation (BCP38)
    # refer to RFC1812, RFC2827, and BCP38 (http://www.bcp38.info)
    "net.ipv4.conf.default.rp_filter" = 1;
    "net.ipv4.conf.all.rp_filter" = 1;

    # log packets with impossible addresses to kernel log
    "net.ipv4.conf.default.log_martians" = 1;
    "net.ipv4.conf.all.log_martians" = 1;

    # do not accept ICMP redirect messages
    "net.ipv4.conf.default.accept_redirects" = 0;
    "net.ipv4.conf.default.secure_redirects" = 0;
    "net.ipv4.conf.all.accept_redirects" = 0;
    "net.ipv4.conf.all.secure_redirects" = 0;

    # disable sending and receiving of shared media redirects
    # this setting overwrites net.ipv4.conf.all.secure_redirects
    # refer to RFC1620
    "net.ipv4.conf.default.shared_media" = 0;
    "net.ipv4.conf.all.shared_media" = 0;

    # always use the best local address for announcing local IP via ARP
    "net.ipv4.conf.default.arp_announce" = 2;
    "net.ipv4.conf.all.arp_announce" = 2;

    # reply only if the target IP address is local address configured on the incoming interface
    "net.ipv4.conf.default.arp_ignore" = 1;
    "net.ipv4.conf.all.arp_ignore" = 1;

    # drop Gratuitous ARP frames to prevent ARP poisoning
    # this can cause issues when ARP proxies are used in the network
    "net.ipv4.conf.default.drop_gratuitous_arp" = 1;
    "net.ipv4.conf.all.drop_gratuitous_arp" = 1;

    # ignore all ICMP echo requests
    #net.ipv4.icmp_echo_ignore_all = 1

    # ignore all ICMP echo and timestamp requests sent to broadcast/multicast
    "net.ipv4.icmp_echo_ignore_broadcasts" = 1;

    # ignore bad ICMP errors
    "net.ipv4.icmp_ignore_bogus_error_responses" = 1;

    # mitigate TIME-WAIT Assassination hazards in TCP
    # refer to RFC1337
    "net.ipv4.tcp_rfc1337" = 1;

    # disable TCP window scaling
    # this makes the host less susceptible to TCP RST DoS attacks
    # could drastically reduce throughput if latency is high
    #net.ipv4.tcp_window_scaling = 0

    # increase system IP port limits
    "net.ipv4.ip_local_port_range" = "1024 65535";

    # TCP timestamps could provide protection against wrapped sequence numbers,
    #   but the host's uptime can be calculated precisely from its timestamps
    # it is also possible to differentiate operating systems based on their use of timestamps
    # - 0: disable TCP timestamps
    # - 1: enable timestamps as defined in RFC1323 and use random offset for
    #        each connection rather than only using the current time
    # - 2: enable timestamps without random offsets
    "net.ipv4.tcp_timestamps" = 0;

    # enabling SACK can increase the throughput
    # but SACK is commonly exploited and rarely used
    "net.ipv4.tcp_sack" = 0;
    "net.ipv4.tcp_dsack" = 0;
    "net.ipv4.tcp_fack" = 0;

    # divide socket buffer evenly between TCP window size and application
    "net.ipv4.tcp_adv_win_scale" = 1;

    # SSR could impact TCP's performance on a fixed-speed network (e.g., wired)
    #   but it could be helpful on a variable-speed network (e.g., LTE)
    # uncomment this if you are on a fixed-speed network
    "net.ipv4.tcp_slow_start_after_idle" = 0;

    # enabling MTU probing helps mitigating PMTU blackhole issues
    # this may not be desirable on congested networks
    "net.ipv4.tcp_mtu_probing" = 1;
    "net.ipv4.tcp_base_mss" = 1024;

    # increase memory thresholds to prevent packet dropping
    "net.ipv4.tcp_rmem" = "4096 87380 8388608";
    "net.ipv4.tcp_wmem" = "4096 87380 8388608";
  };
}
