#!/bin/bash
apt install -y apache2 unzip php libapache2-mod-php php-sqlite3 php-gd

mkdir /var/www/html/grocy/
cd /var/www/html/grocy
rm index.html
version="3.2.0"
wget -q "https://github.com/grocy/grocy/releases/download/v${version}/grocy_${version}.zip"
unzip "grocy_${version}.zip"
rm "grocy_${version}.zip"
chmod +x update.sh
chown www-data: /var/www/html -R

cp /var/www/html/grocy/config-dist.php /var/www/html/grocy/data/config.php

echo -e "<VirtualHost *:80>" >> /etc/apache2/sites-available/grocy.conf
echo -e "  ServerAdmin webmaster@localhost" >> /etc/apache2/sites-available/grocy.conf
echo -e "  DocumentRoot /var/www/html/public" >> /etc/apache2/sites-available/grocy.conf
echo -e "  ErrorLog \${APACHE_LOG_DIR}/error.log" >> /etc/apache2/sites-available/grocy.conf
echo -e "  CustomLog \${APACHE_LOG_DIR}/access.log vhost_combined" >> /etc/apache2/sites-available/grocy.conf
echo -e "</VirtualHost>" >> /etc/apache2/sites-available/grocy.conf

sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

a2dissite 000-default.conf
a2ensite grocy.conf

a2enmod rewrite
systemctl reload apache2

ip=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')
echo ""
echo ""
echo "--------------------------------------------------------------------------"
echo "Instal complete!"
echo "Navigate to http://${ip}/"
echo ""
echo "Don't forget to change the default Username & Password (admin/admin)!!!"
echo "--------------------------------------------------------------------------"
