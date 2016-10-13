#!/usr/bin/env ruby

## SOOO BAAAAAD, not proud of that absolutely need to be updated before prod but will do for my demo

certname=ARGV[0]
`puppet cert --allow-dns-alt-names --ssldir /etc/puppetlabs/puppet/ssl sign #{certname}`
exit 0
