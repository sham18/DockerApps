#!/bin/bash

if [ ! -f /var/lib/mysql/ibdata1 ]; then
   echo "Createing new DB" > /tmp/sql.log
    mysql_install_db

    /usr/bin/mysqld_safe &
    sleep 5;    
    until mysqladmin ping &>/dev/null; do
	  echo -n "."; sleep 0.2
    done

    #mysqladmin -u root password 'admin'
    #mysqladmin -u root -h localhost password 'admin'
    #mysql -e "GRANT ALL ON *.* TO root@'%' IDENTIFIED BY 'admin' WITH GRANT OPTION"

    #echo "GRANT ALL ON *.* TO root@'%' IDENTIFIED BY 'admin' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql
    #echo "GRANT ALL ON *.* TO admin@'%' IDENTIFIED BY 'admin' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql

     
    #mysql -u root -padmin  < /opt/bucketlist.sql

    killall mysqld
    sleep 10s
fi

/usr/bin/mysqld_safe &
