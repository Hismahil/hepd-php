# == Class: php::module
#
# Class for install modules to PHP
#
# === Parameters
#
# [*module*]
#   Vector of modules for PHP
#
#
# === Authors
#
# Hismahil E. P. Dinis <hismahilepd@gmail.com>
#
# === Copyright
#
# Copyright 2016 Hismahil E. P. Dinis.
#
class php::module(
	$module = []
) {
	
	package { $module:
		ensure	=> installed
	}
}