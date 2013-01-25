define dhcp::host (
  $ip,
  $mac,
  $comment='',
  $option_hostname=$title,
) {

  $host = $title
  include dhcp::params

  $dhcp_dir = $dhcp::params::dhcp_dir

  concat::fragment { "dhcp_host_${title}":
    target  => "${dhcp_dir}/dhcpd.hosts",
    content => template('dhcp/dhcpd.host.erb'),
    order   => 10,
  }
}

