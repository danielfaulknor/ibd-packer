#!/bin/bash

# install apache2
apt-get install -y apache2

# enable configuration for /vagrant
mv /tmp/ubuntu/apache2/conf-available/vagrant.conf /etc/apache2/conf-available/vagrant.conf
chown root:root /etc/apache2/conf-available/vagrant.conf
chmod 664 /etc/apache2/conf-available/vagrant.conf
ln -s /etc/apache2/conf-available/vagrant.conf /etc/apache2/conf-enabled/vagrant.conf

# setup the default vhost
rm /etc/apache2/sites-available/*
rm /etc/apache2/sites-enabled/*
mv /tmp/common/apache2/sites-available/default /etc/apache2/sites-available/default.conf
chown root:root /etc/apache2/sites-available/default.conf
chmod 664 /etc/apache2/sites-available/default.conf
ln -s /etc/apache2/sites-available/default.conf /etc/apache2/sites-enabled/000-default.conf

# enable mod_rewrite
mv /tmp/common/apache2/mods-available/rewrite.load /etc/apache2/mods-available/rewrite.load
chown root:root /etc/apache2/mods-available/rewrite.load
chmod 664 /etc/apache2/mods-available/rewrite.load
ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load

# add vagrant user to www-data group
usermod -a -G www-data vagrant
