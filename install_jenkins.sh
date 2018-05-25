#!/bin/bash

echo "this  is going to install java in rpm distribution"
echo "Installing jdk-8u131-linux-x64.rpm on This macine"
echo "If you want to install any another version change wget"

yum install -y java-1.7.0-openjdk-devel

sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo

sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key

yum --showduplicates list jenkins | expand

#echo "enter the jenkins package name"

#read package_name

#echo "Enter the jenkins version number"

#read version_number
yum install jenkins-2.9-1.1

sudo service jenkins start

sudo chkconfig jenkins on

sudo iptables -I INPUT 1 -p tcp --dport 8443 -j ACCEPT
sudo iptables -I INPUT 1 -p tcp --dport 8080 -j ACCEPT
sudo iptables -I INPUT 1 -p tcp --dport 443 -j ACCEPT
sudo iptables -I INPUT 1 -p tcp --dport 80 -j ACCEPT

echo "Now showing you the jenkins initial keys please copy and paste....."

sudo cat /var/lib/jenkins/secrets/initialAdminPassword
