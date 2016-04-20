# == Class: php::dependencies
#
# Install repository of dependêncies 
#
# === Variables
#
# [*dep*]
#   Some dependencies
#
# === Authors
#
# Hismahil E. P. Dinis <hismahilepd@gmail.com>
#
# === Copyright
#
# Copyright 2016 Hismahil E. P. Dinis.
#
class php::dependencies{
	
	exec {
    	'libcurl4-openssl-dev-libssl-dev-repository':
    		command		=> "echo 'deb http://security.ubuntu.com/ubuntu precise-security main' >> /etc/apt/sources.list",
			path		=> '/usr/bin:/bin',
    }

    exec{ 'update-repositories-dependencies':
		command		=> 'apt-get update',
		path		=> '/usr/bin:/bin',
		require		=> Exec['libcurl4-openssl-dev-libssl-dev-repository'],
	}

	$dep = ['git-core', 'curl', 'zlib1g-dev', 'build-essential', 'libssl-dev', 'libreadline-dev', 'libyaml-dev', 'libsqlite3-dev', 'sqlite3', 'libxml2-dev', 'libxslt1-dev', 'libcurl4-openssl-dev', 'python-software-properties', 'libffi-dev']

	package { $dep:
		ensure		=> installed,
		require		=> Exec['update-repositories-dependencies'],
	}
}