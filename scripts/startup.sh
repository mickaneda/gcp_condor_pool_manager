#!/usr/bin/env bash

curl -LOkSs   https://github.com/mickaneda/gcpm-puppet/archive/master.zip
unzip master.zip >/dev/null
cd gcpm-puppet-master
./setup.sh
/opt/puppetlabs/bin/puppet apply /etc/puppetlabs/code/environments/production/manifests/site.pp --verbose
