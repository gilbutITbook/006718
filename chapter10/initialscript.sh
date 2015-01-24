#!/bin/bash

echo '192.168.122.1 valkyries.linuxmaster.com losttemple' >> /etc/hosts

cd /home/administrator
mkdir .ssh
cd .ssh
wget http://192.168.122.1/authorized_keys
chmod 600 authorized_keys

cd /home/administrator
wget http://apt.puppetlabs.com/puppetlabs-release-trusty.deb
sudo dpkg -i puppetlabs-release-trusty.deb
sudo apt-get update
sudo apt-get install -y puppet

echo "[agent]" >> /etc/puppet/puppet.conf
echo "server=valkyries.linuxmaster.com" >> /etc/puppet/puppet.conf
echo "runinterval=60" >> /etc/puppet/puppet.conf

/bin/sed -i 's/START\=no/START\=yes/' '/etc/default/puppet'
