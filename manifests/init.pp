# == Class: php
#
# Class for install a version of PHP (5.4, 5.5, 5.6 and 7.0).
#
# === Parameters
#
# [*version*]
#   Version of PHP.
#
# === Variables
#
# [*php*]
#   Version selected.
#
# === Examples
#
#	class { 'php':
#		version	=> '7.0'
#	}
#
# === Authors
#
# Hismahil E. P. Dinis <hismahilepd@gmail.com>
#
# === Copyright
#
# Copyright 2016 Hismahil E. P. Dinis.
#
class php(
	$version,
) {

	include apt

	Class['apt::update'] -> Class['php::dependencies']

	# install dependencies
	class { 'php::dependencies': }

	# install PPA
	case $version {
		'5.4': {
			apt::ppa { 'ppa:ondrej/php5-oldstable': }
			$php = 'php5'
		}
		'5.5': { 
			apt::ppa { 'ppa:ondrej/php5': }
			$php = 'php5'
		}
		'5.6': { 
			apt::ppa { 'ppa:ondrej/php5-5.6': }
			$php = 'php5'
		}
		'7.0': {
			apt::ppa { 'ppa:ondrej/php': }
			$php = 'php7.0'
		}
		default: { 
			apt::ppa { 'ppa:ondrej/php': }	# php 7 default
			$php = 'php7.0'
		}
	}

	# install PHP
	package { $php:
		ensure	=> installed
	}
}
