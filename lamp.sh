#/bin/bash

echo '*************Installing Apache web Server***************'

apt install apache2 -y

echo '************Apache Web Server is Installed***************'

echo '************Installing Maria DB*******************'

apt install mariadb-server -y

echo '************Maria DB Installed*******************'

echo '************Installing Php*******************'
apt install php php-pear php-dev libapache2-mod-php php-common php-mbstring php-xmlrpc php-soap php-gd php-xml php-mysql php-cli php-mcrypt php-zip

echo '************Php and its modules are Installed*******************'

echo '***********Install Composer to Download Laravel*****************'

curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

echo '************Starting the Services*******************'

systemctl restart apache2 
systemctl restart mariadb

echo 'Enabling the Service......................'

systemctl enable apache2
systemctl enable mariadb

echo '*****************Checking the status of the Service******************'

echo Apache Service is $(systemctl show -p ActiveState --value apache2)
echo Maria DB Service is $(systemctl show -p ActiveState --value mariadb)

echo '%%******LAMP Setup is installed on ubuntu******%%'
