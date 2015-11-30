#!/bin/bash

add-apt-repository -y ppa:webupd8team/java

apt-get -y update

#install jdk 8
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections 
apt-get install -y oracle-java8-installer
apt-get install -y oracle-java8-set-default

# install ubuntu desktop
apt-get install -y ubuntu-desktop

#install eclipse mars
cd /tmp
wget http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/mars/1/eclipse-jee-mars-1-linux-gtk-x86_64.tar.gz&mirror_id=1215
tar -zxvf /vagrant/install/eclipse-*.tar.gz /opt
cp /vagrant/install/eclipse.desktop /usr/share/applications/
desktop-file-install /usr/share/applications/eclipse.desktop
ln -s /opt/eclipse/eclipse /usr/local/bin/

# #Install glassfish
cd /tmp
wget 'http://download.java.net/glassfish/4.1/release/glassfish-4.1.zip'
unzip glassfish-4.1*zip -d /opt