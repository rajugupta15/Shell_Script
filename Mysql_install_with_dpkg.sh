#!/bin/bash
mysqlpackage="mysql-common_5.6.*amd64.deb libmysqlclient18_5.6.*amd64.deb libaio1_0.3.*amd64.deb mysql-community-client_5.6.*amd64.deb mysql-client_5.6.*amd64.deb mysql-community-server_5.6.*amd64.deb mysql-server_5.6.*amd64.deb"
currentdir=`pwd`
rm -rf /bin/sh
ln -s /bin/bash /bin/sh
for f in ${mysqlpackage}
do
        dpkg -i ${currentdir}/$f \n
done
sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
mysqladmin -uroot password c\!\*udj\#\#
mysql -uroot -pc\!\*udj\#\# -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'c!*udj##'"
mysql -uroot -pc\!\*udj\#\# -e "GRANT SELECT, INSERT ON *.* TO 'root'@'%' IDENTIFIED BY 'c!*udj##'"
mysql -uroot -pc\!\*udj\#\# -e "FLUSH PRIVILEGES;"

service mysql restart
