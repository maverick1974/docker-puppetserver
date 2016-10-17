#!/bin/bash

if test -n "${CA}" && ! ${CA} && getent hosts ${DB_SERVER} > /dev/null 2>&1 ; then
  echo "Configure puppetdb-termini"
  puppet config set storeconfigs true --section master
  puppet config set storeconfigs_backend puppetdb --section master
  cat << EOF > $(puppet config print route_file)
---
master:
  facts:
    terminus: puppetdb
    cache: yaml
EOF
  cat << EOF > /etc/puppetlabs/puppet/puppetdb.conf
[main]
server_urls = https://${DB_SERVER}:8081/
soft_write_failure = true
EOF
fi
