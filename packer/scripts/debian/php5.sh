#!/bin/bash

# install php5
apt-get install -y php5 php5-mysql php5-curl php5-gd libapache2-mod-php5 php5-dev php5-xdebug php-pear

# upgrade pear
/usr/bin/pear upgrade

# set channels to auto discover
/usr/bin/pear config-set auto_discover 1

# update channels
/usr/bin/pear update-channels
