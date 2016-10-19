#!/bin/bash

## SOOO BAAAAAD, not proud of that, absolutely need to be updated before prod but will do for my demo
csr=$(< /dev/stdin)
certname=$1

if echo "${csr}" | openssl req -noout -text | grep -q 'X509v3 Subject Alternative Name'; then
	puppet cert --allow-dns-alt-names --ssldir /etc/puppetlabs/puppet/ssl sign ${certname}
fi

exit 0
