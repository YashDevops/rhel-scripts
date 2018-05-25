#!/bin/bash

echo "This script will install the Nexus reespository in you instance"

yum update -y

yum install java-1.8.0-openjdk.x86_64

mkdir /app && cd /app

wget https://sonatype-download.global.ssl.fastly.net/nexus/3/nexus-3.0.2-02-unix.tar.gz

tar -xvf nexus-3.0.2-02-unix.tar.gz

mv nexus-3.0.2-02 nexus

adduser nexus

chown -R nexus:nexus /app/nexus

echo "run_as_user=\"nexus\"" >>/app/nexus/bin/nexus.rc

sudo ln -s /app/nexus/bin/nexus /etc/init.d/nexus

sudo chkconfig --add nexus

sudo chkconfig --levels 345 nexus on

sudo service nexus start