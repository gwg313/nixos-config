{
  config,
  pkgs,
  ...
}: {
  boot.kernel.sysctl = {
    # disallow IPv6 packet forwarding
    "net.ipv6.conf.default.forwarding" = 0;
    "net.ipv6.conf.all.forwarding" = 0;

    # number of Router Solicitations to send until assuming no routers are present
    "net.ipv6.conf.default.router_solicitations" = 0;
    "net.ipv6.conf.all.router_solicitations" = 0;

    # do not accept Router Preference from RA
    "net.ipv6.conf.default.accept_ra_rtr_pref" = 0;
    "net.ipv6.conf.all.accept_ra_rtr_pref" = 0;

    # learn prefix information in router advertisement
    "net.ipv6.conf.default.accept_ra_pinfo" = 0;
    "net.ipv6.conf.all.accept_ra_pinfo" = 0;

    # setting controls whether the system will accept Hop Limit settings from a router advertisement
    "net.ipv6.conf.default.accept_ra_defrtr" = 0;
    "net.ipv6.conf.all.accept_ra_defrtr" = 0;

    # router advertisements can cause the system to assign a global unicast address to an interface
    "net.ipv6.conf.default.autoconf" = 0;
    "net.ipv6.conf.all.autoconf" = 0;

    # number of neighbor solicitations to send out per address
    "net.ipv6.conf.default.dad_transmits" = 0;
    "net.ipv6.conf.all.dad_transmits" = 0;

    # number of global unicast IPv6 addresses can be assigned to each interface
    "net.ipv6.conf.default.max_addresses" = 1;
    "net.ipv6.conf.all.max_addresses" = 1;

    # enable IPv6 Privacy Extensions (RFC30;41) and prefer the temporary address
    #"net.ipv6.conf.default.use_tempaddr" = 2; # Nix sets by default
    "net.ipv6.conf.all.use_tempaddr" = 2;

    # ignore IPv6 ICMP redirect messages
    "net.ipv6.conf.default.accept_redirects" = 0;
    "net.ipv6.conf.all.accept_redirects" = 0;

    # do not accept packets with SRR option
    "net.ipv6.conf.default.accept_source_route" = 0;
    "net.ipv6.conf.all.accept_source_route" = 0;

    # ignore all ICMPv6 echo requests
    #net.ipv6.icmp.echo_ignore_all = 1
    #net.ipv6.icmp.echo_ignore_anycast = 1
    #net.ipv6.icmp.echo_ignore_multicast = 1
  };
}
