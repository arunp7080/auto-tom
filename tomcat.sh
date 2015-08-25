#/bin/bash
sudo cat sources.list > /etc/apt/sources.list
sudo apt-get -y update
sudo apt-get install -y debconf-utils
sudo apt-get install -y tomcat7
#sudo service tomcat7 start
sudo echo "mysql-server mysql-server/root_password password redhat" | debconf-set-selections
sudo echo "mysql-server mysql-server/root_password_again password redhat" | debconf-set-selections
sudo apt-get install -y mysql-server
sudo apt-get install -y authbind
sudo sed -i 's/8080/80/g' /var/lib/tomcat7/conf/server.xml
sudo touch /etc/authbind/byport/80
sudo chmod 500 /etc/authbind/byport/80
sudo chown tomcat7 /etc/authbind/byport/80
sudo sed -i 's/#AUTHBIND=no/AUTHBIND=yes/g' /etc/default/tomcat7
sudo wget -O /var/lib/tomcat7/webapps/petclinic.war http://54.202.69.46/petclinic.war
sudo /etc/init.d/tomcat7 restart
sudo sh dbsetup.sh
sudo sed -i 's/%DB_TIER_IP%/localhost/g' /var/lib/tomcat7/webapps/petclinic/WEB-INF/classes/jdbc.properties
sudo /etc/init.d/tomcat7 restart
