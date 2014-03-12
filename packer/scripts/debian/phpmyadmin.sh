#!/bin/bash

# We do a manual install of phpmyadmin to get a more recent version

# download and extract phpmyadmin
wget http://downloads.sourceforge.net/project/phpmyadmin/phpMyAdmin/4.0.10/phpMyAdmin-4.0.10-english.tar.gz -P /tmp/
tar -xzvf /tmp/phpMyAdmin-4.0.10-english.tar.gz

# move to /usr/share
mv phpMyAdmin-4.0.10-english /usr/share/phpmyadmin/

# create the other directories
mkdir /var/lib/phpmyadmin
mkdir /var/lib/phpmyadmin/tmp
chown www-data:www-data /var/lib/phpmyadmin/tmp
chmod 644 /var/lib/phpmyadmin/tmp

# config.inc.php
mv /tmp/debian/phpmyadmin/config.inc.php /usr/share/phpmyadmin/config.inc.php

# configure the vhost
mv /tmp/debian/phpmyadmin/apache.conf /etc/apache2/sites-available/phpmyadmin
ln -s /etc/apache2/sites-available/phpmyadmin /etc/apache2/sites-enabled/001-phpmyadmin
