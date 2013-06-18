class ssh::params {
    $ensure             = 'present'
    $ensure_running     = true
    $ensure_enabled     = true
    $manage_known_hosts = true
    $manage_users       = true
    $manage_groups      = true
    $permit_root_login  = 'no'
    $listen_address     = "0.0.0.0"

    # will fetch users and groups from all hiera files and merge them into one hash
    $users              = hiera_hash('ssh_users')
    $groups             = hiera_hash('ssh_groups')

    case $::osfamily {
        'Debian': {
            $service_name = 'ssh'
        }
        'RedHat': {
            $service_name = 'sshd'
        }
        default: {
            fail('unsupported platform')
        }
    }

}
