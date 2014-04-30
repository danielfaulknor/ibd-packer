#!/bin/bash

# install mariadb server
echo "mysql-server mysql-server/root_password password vagrant" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password vagrant" | debconf-set-selections
apt-get -y install mariadb-server

# create a vagrant database
mysql -uroot -pvagrant < /tmp/common/vagrant.sql
