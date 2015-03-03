#!/bin/bash -ex

sudo puppet apply --hiera_config=/vagrant/hiera-vagrant.yaml --modulepath '/vagrant/modules/custom/:/vagrant/modules/forge:/vagrant/modules/profiles:/vagrant/modules/roles/' --manifestdir /vagrant/manifests/ --detailed-exitcodes /vagrant/manifests/site.pp