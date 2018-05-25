#!/bin/bash

echo "this  is going to install java in rpm distribution"
echo "Installing jdk-8u131-linux-x64.rpm on This macine"
echo "If you want to install any another version change wget"

yum update

wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm

rpm -i jdk-*-*-*.rpm

/usr/sbin/alternatives --install /usr/bin/java java /usr/java/jdk1.8.0_131/java 300

/usr/sbin/alternatives --config java