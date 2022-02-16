# @summary Class to manage SSH client
#
# Notes: `Match` and `Host` attributes are not directly supported as multiple
# match/host blocks can exist. Use the `custom` parameter for that.
#
# @param config_entries
#
# @param config_group
#
# @param config_mode
#
# @param config_owner
#
# @param config_path
#
# @param global_known_hosts_group
#
# @param global_known_hosts_mode
#
# @param global_known_hosts_owner
#
# @param global_known_hosts_path
#
# @param keys
#
# @param manage_global_known_hosts
#
# @param manage_root_ssh_config
#
# @param manage_server
#
# @param manage_sshkey
#
# @param package_adminfile
#
# @param packages
#
# @param package_source
#
# @param purge_keys
#
# @param root_ssh_config_content
#
# @param host
#
# @param add_keys_to_agent
#
# @param address_family
#
# @param batch_mode
#
# @param bind_address
#
# @param bind_interface
#
# @param canonical_domains
#
# @param canonicalize_fallback_local
#
# @param canonicalize_hostname
#
# @param canonicalize_max_dots
#
# @param canonicalize_permitted_cnames
#
# @param ca_signature_algorithms
#
# @param certificate_file
#
# @param challenge_response_authentication
#
# @param check_host_ip
#
# @param ciphers
#
# @param clear_all_forwardings
#
# @param compression
#
# @param connection_attempts
#
# @param connect_timeout
#
# @param control_master
#
# @param control_path
#
# @param control_persist
#
# @param dynamic_forward
#
# @param enable_ssh_keysign
#
# @param escape_char
#
# @param exit_on_forward_failure
#
# @param fingerprint_hash
#
# @param forward_agent
#
# @param forward_x11
#
# @param forward_x11_timeout
#
# @param forward_x11_trusted
#
# @param gateway_ports
#
# @param global_known_hosts_file
#
# @param gss_api_authentication
#
# @param gss_api_delegate_credentials
#
# @param hash_known_hosts
#
# @param hostbased_authentication
#
# @param hostbased_key_types
#
# @param host_key_algorithms
#
# @param host_key_alias
#
# @param hostname
#
# @param identities_only
#
# @param identity_agent
#
# @param identity_file
#
# @param ignore_unknown
#
# @param include
#
# @param ip_qos
#
# @param kbd_interactive_authentication
#
# @param kbd_interactive_devices
#
# @param kex_algorithms
#
# @param local_command
#
# @param local_forward
#
# @param log_level
#
# @param no_host_authentication_for_localhost
#
# @param number_of_password_prompts
#
# @param password_authentication
#
# @param permit_local_command
#
# @param pkcs11_provider
#
# @param port
#
# @param preferred_authentications
#
# @param protocol
#
# @param proxy_command
#
# @param proxy_jump
#
# @param proxy_use_fdpass
#
# @param pubkey_accepted_key_types
#
# @param pubkey_authentication
#
# @param rekey_limit
#
# @param remote_command
#
# @param remote_forward
#
# @param request_tty
#
# @param revoked_host_keys
#
# @param send_env
#
# @param server_alive_count_max
#
# @param server_alive_interval
#
# @param set_env
#
# @param stream_local_bind_mask
#
# @param stream_local_bind_unlink
#
# @param strict_host_key_checking
#
# @param syslog_facility
#
# @param tcp_keep_alive
#
# @param tunnel
#
# @param tunnel_device
#
# @param update_host_keys
#
# @param user
#
# @param user_known_hosts_file
#
# @param use_roaming
#
# @param verify_host_key_dns
#
# @param visual_host_key
#
# @param xauth_location
#
# @param custom
#
class ssh (
  Hash $config_entries = {},
  String[1] $config_group = 'root',
  Stdlib::Filemode $config_mode = '0644',
  String[1] $config_owner = 'root',
  Stdlib::Absolutepath $config_path = '/etc/ssh/ssh_config',
  String[1] $global_known_hosts_group = 'root',
  Stdlib::Filemode $global_known_hosts_mode = '0644',
  String[1] $global_known_hosts_owner = 'root',
  Stdlib::Absolutepath $global_known_hosts_path = '/etc/ssh/ssh_known_hosts',
  Hash $keys = {},
  Boolean $manage_global_known_hosts = true,
  Boolean $manage_root_ssh_config = false,
  Boolean $manage_server = true,
  Boolean $manage_sshkey = true,
  Optional[Stdlib::Absolutepath] $package_adminfile = undef,
  Optional[Array[String[1]]] $packages = [],
  Optional[Stdlib::Absolutepath] $package_source = undef,
  Boolean $purge_keys = true,
  String[1] $root_ssh_config_content = "# This file is being maintained by Puppet.\n# DO NOT EDIT\n",
  # class parameters below this line directly correlate with ssh_config parameters
  String[1] $host = '*',
  Optional[Enum['yes', 'no', 'ask', 'confirm']] $add_keys_to_agent = undef,
  Optional[Enum['any', 'inet', 'inet6']] $address_family = undef,
  Optional[Ssh::Yes_no] $batch_mode = undef,
  Optional[String[1]] $bind_address = undef,
  Optional[String[1]] $bind_interface = undef,
  Optional[Array[String[1]]] $canonical_domains = undef,
  Optional[Ssh::Yes_no] $canonicalize_fallback_local = undef,
  Optional[Enum['yes', 'no', 'always']] $canonicalize_hostname = undef,
  Optional[Integer[0]] $canonicalize_max_dots = undef,
  Optional[Array[String[1]]] $canonicalize_permitted_cnames = undef,
  Optional[Array[String[1]]] $ca_signature_algorithms = undef,
  Optional[Array[String[1]]] $certificate_file = undef,
  Optional[Ssh::Yes_no] $challenge_response_authentication = undef,
  Optional[Ssh::Yes_no] $check_host_ip = undef,
  Optional[Array[String[1]]] $ciphers = undef,
  Optional[Ssh::Yes_no] $clear_all_forwardings = undef,
  Optional[Ssh::Yes_no] $compression = undef,
  Optional[Integer[0]] $connection_attempts = undef,
  Optional[Integer[0]] $connect_timeout = undef,
  Optional[Enum['yes', 'no', 'ask', 'auto', 'autoask']] $control_master = undef,
  Optional[String[1]] $control_path = undef,
  Optional[String[1]] $control_persist = undef,
  Optional[String[1]] $dynamic_forward = undef,
  Optional[Ssh::Yes_no] $enable_ssh_keysign = undef,
  Optional[String[1]] $escape_char = undef,
  Optional[Ssh::Yes_no] $exit_on_forward_failure = undef,
  Optional[Enum['sha256', 'md5']] $fingerprint_hash = undef,
  Optional[Ssh::Yes_no] $forward_agent = undef,
  Optional[Ssh::Yes_no] $forward_x11 = undef,
  Variant[Undef, String[1], Integer[0]] $forward_x11_timeout = undef,
  Optional[Ssh::Yes_no] $forward_x11_trusted = undef,
  Optional[Ssh::Yes_no] $gateway_ports = undef,
  Optional[Array[String[1]]] $global_known_hosts_file = undef,
  Optional[Ssh::Yes_no] $gss_api_authentication = undef,
  Optional[Ssh::Yes_no] $gss_api_delegate_credentials = undef,
  Optional[Ssh::Yes_no] $hash_known_hosts = undef,
  Optional[Ssh::Yes_no] $hostbased_authentication = undef,
  Optional[Array[String[1]]] $hostbased_key_types = undef,
  Optional[Array[String[1]]] $host_key_algorithms = undef,
  Optional[String[1]] $host_key_alias = undef,
  Optional[String[1]] $hostname = undef,
  Optional[Ssh::Yes_no] $identities_only = undef,
  Optional[String[1]] $identity_agent = undef,
  Optional[Array[String[1]]] $identity_file = undef,
  Optional[Array[String[1]]] $ignore_unknown = undef,
  Optional[String[1]] $include = undef,
  Optional[String[1]] $ip_qos = undef,
  Optional[Ssh::Yes_no] $kbd_interactive_authentication = undef,
  Optional[Array[String[1]]] $kbd_interactive_devices = undef,
  Optional[Array[String[1]]] $kex_algorithms = undef,
  Optional[String[1]] $local_command = undef,
  Optional[String[1]] $local_forward = undef,
  Optional[Ssh::Log_level] $log_level = undef,
  Optional[Ssh::Yes_no] $no_host_authentication_for_localhost = undef,
  Optional[Integer] $number_of_password_prompts = undef,
  Optional[Ssh::Yes_no] $password_authentication = undef,
  Optional[Ssh::Yes_no] $permit_local_command = undef,
  Optional[String[1]] $pkcs11_provider = undef,
  Optional[Stdlib::Port] $port = undef,
  Optional[Array[String[1]]] $preferred_authentications = undef,
  Optional[String[1]] $protocol = undef,
  Optional[String[1]] $proxy_command = undef,
  Optional[Array[String[1]]] $proxy_jump = undef,
  Optional[Ssh::Yes_no] $proxy_use_fdpass = undef,
  Optional[Array[String[1]]] $pubkey_accepted_key_types = undef,
  Optional[Ssh::Yes_no] $pubkey_authentication = undef,
  Optional[String[1]] $rekey_limit = undef,
  Optional[String[1]] $remote_command = undef,
  Optional[String[1]] $remote_forward = undef,
  Optional[Enum['no', 'yes', 'force', 'auto']] $request_tty = undef,
  Optional[String[1]] $revoked_host_keys = undef,
  Optional[Array[String[1]]] $send_env = undef,
  Variant[Undef, String[1], Integer[0]] $server_alive_count_max = undef,
  Variant[Undef, String[1], Integer[0]] $server_alive_interval = undef,
  Optional[Array[String[1]]] $set_env = undef,
  Optional[Pattern[/^[0-7]{4}$/]] $stream_local_bind_mask = undef,
  Optional[Ssh::Yes_no] $stream_local_bind_unlink = undef,
  Optional[Enum['yes', 'no', 'accept-new', 'off', 'ask']] $strict_host_key_checking = undef,
  Optional[Ssh::Syslog_facility] $syslog_facility = undef,
  Optional[Ssh::Yes_no] $tcp_keep_alive = undef,
  Optional[Enum['yes', 'no', 'point-to-point', 'ethernet']] $tunnel = undef,
  Optional[String[1]] $tunnel_device = undef,
  Optional[Enum['yes', 'no', 'ask']] $update_host_keys = undef,
  Optional[String[1]] $user = undef,
  Optional[Array[String[1]]] $user_known_hosts_file = undef,
  Optional[Ssh::Yes_no] $use_roaming = undef,
  Optional[Enum['yes', 'no', 'ask']] $verify_host_key_dns = undef,
  Optional[Ssh::Yes_no] $visual_host_key = undef,
  Optional[String[1]] $xauth_location = undef,
  # custom is a string that allows for multiple lines to be appended to end of
  # the sshd_config file.
  Optional[Array[String[1]]] $custom = undef
) {

  package { $packages:
    ensure    => installed,
    source    => $package_source,
    adminfile => $package_adminfile,
    before    => 'File[ssh_config]',
  }

  file  { 'ssh_config' :
    ensure  => file,
    path    => $config_path,
    owner   => $config_owner,
    group   => $config_group,
    mode    => $config_mode,
    content => template('ssh/ssh_config.erb'),
  }

  if $manage_root_ssh_config == true {

    exec { "mkdir_p-${::root_home}/.ssh":
      command => "mkdir -p ${::root_home}/.ssh",
      unless  => "test -d ${::root_home}/.ssh",
      path    => '/bin:/usr/bin',
    }

    file { 'root_ssh_dir':
      ensure  => directory,
      path    => "${::root_home}/.ssh",
      owner   => 'root',
      group   => 'root',
      mode    => '0700',
      require => Exec["mkdir_p-${::root_home}/.ssh"],
    }

    file { 'root_ssh_config':
      ensure  => file,
      path    => "${::root_home}/.ssh/config",
      content => $root_ssh_config_content,
      owner   => 'root',
      group   => 'root',
      mode    => '0600',
    }
  }

  if $manage_global_known_hosts == true {
    file { 'global_known_hosts':
      ensure  => file,
      path    => $global_known_hosts_path,
      owner   => $global_known_hosts_owner,
      group   => $global_known_hosts_group,
      mode    => $global_known_hosts_mode,
      require => 'File[ssh_config]',
    }
  }

  # remove ssh key's not managed by puppet
  if $manage_sshkey == true {
    resources  { 'sshkey':
      purge => $purge_keys,
    }
  }

  # manage users' ssh config entries if present
  $config_entries.each |$key,$value| {
    ssh::config_entry { $key:
      * => $value,
    }
  }

  # manage users' ssh authorized keys if present
  if $keys.empty == false {
    $keys.each |$key,$value| {
      ssh_authorized_key { $key:
        * => $value,
      }
    }
  }

  if $manage_server == true {
    include ssh::server
  }
}
