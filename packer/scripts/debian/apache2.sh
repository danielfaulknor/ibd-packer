#!/bin/bash

# install apache2
apt-get install -y apache2

# copy httpd.conf and set permissions
mv /tmp/debian/apache2/httpd.conf /etc/apache2/conf.d/user
chown root:root /etc/apache2/conf.d/user
chmod 644 /etc/apache2/conf.d/user

# setup the default vhost
rm /etc/apache2/sites-available/*
mv /tmp/debian/apache2/sites-available/default /etc/apache2/sites-available/default
chown root:root /etc/apache2/sites-available/default
chmod 664 /etc/apache2/sites-available/default
ln -s /etc/apache2/sites-available/default /etc/apache2/sites-enabled/000-default

# enable mod_rewrite
mv /tmp/debian/apache2/mods-available/rewrite.load /etc/apache2/mods-available/rewrite.load
chown root:root /etc/apache2/mods-available/rewrite.load
chmod 664 /etc/apache2/mods-available/rewrite.load
ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load
