#!/bin/bash

# Get codename in order to fetch correct .deb from Puppetlabs
CODENAME=`lsb_release -s -c`

# fetch .deb + pubkey
wget -O /tmp/puppetlabs-release-${CODENAME}.deb https://apt.puppetlabs.com/puppetlabs-release-${CODENAME}.deb
wget -O /tmp/puppetlabs-pubkey.gpg https://apt.puppetlabs.com/pubkey.gpg

# import puppetlabs pubkey
apt-key add /tmp/puppetlabs-pubkey.gpg
dpkg -i /tmp/puppetlabs-release-${CODENAME}.deb

# update package lists (including new sources from .deb) + install puppet
apt-get update
apt-get install -y puppet facter

# cleanup
rm /tmp/puppetlabs-release-${CODENAME}.deb
rm /tmp/puppetlabs-pubkey.gpg
