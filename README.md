# php

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [Setup requirements](#setup-requirements)
4. [Usage](#usage)
5. [Limitations - OS compatibility, etc.](#limitations)

## Overview

Module created for install php versions: 5.4, 5.5, 5.6 and 7.0

## Module Description

This module installs the repository of the above versions, install some dependencies and
does the PHP installation.

## Setup

### Setup Requirements

Requires the APT modules and stdlib the puppetlabs.

## Usage

```puppet
node default {
	class { 'php':
		version	=> '7.0'
	}

	$modules = [ 'php7.0-fpm', 'php7.0-mysql', 'php7.0-cli', 'php7.0-common', 'libapache2-mod-php7.0', 'php7.0-curl', 'php7.0-gd', 'php7.0-bz2']
	
	class { 'php::module':
		module 	=> $modules
	}
}
```

## Limitations

Only tested with Ubuntu 14.04.
