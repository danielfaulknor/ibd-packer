#!/bin/bash

# install mysql server
echo "mysql-server-5.1 mysql-server/root_password_again password vagrant" | debconf-set-selections
echo "mysql-server-5.1 mysql-server/root_password password vagrant" | debconf-set-selections
apt-get -y install mysql-server

# create a vagrant database
mysql -uroot -pvagrant < /tmp/debian/vagrant.sql
