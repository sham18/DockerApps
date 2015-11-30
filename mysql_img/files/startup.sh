#!/bin/bash

if [ ! -f /var/lib/mysql/ibdata1 ]; then
   echo "Creating  user $user for databases loaded from $url"
    #mysql_install_db

    /usr/bin/mysqld_safe &
    sleep 5;    
    curl $url -o bucketlist.sql    


   mysql --default-character-set=utf8 < /opt/bucketlist.sql
   mysqladmin shutdown
   echo "Finished 1"


   # Time to add provided user credentials
   /usr/bin/mysqld_safe &
   sleep 5
   
   echo "Creating user"
   echo "CREATE USER '$user' IDENTIFIED BY '$password'" | mysql --default-character-set=utf8
   echo "GRANT ALL PRIVILEGES ON *.* TO '$user'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql --default-character-set=utf8

   ## Start the server to GO operational
   mysqladmin shutdown
   echo "Starting my sql Server"

   /usr/bin/mysqld_safe &
   
   echo "Mysql Server started.."

#until mysqladmin ping &>/dev/null; do
	#  echo -n "."; sleep 0.2
    #done

    #mysqladmin -u root password 'admin'
    #mysqladmin -u root -h localhost password 'admin'
    #mysql -e "GRANT ALL ON *.* TO root@'%' IDENTIFIED BY 'admin' WITH GRANT OPTION"

    #echo "GRANT ALL ON *.* TO root@'%' IDENTIFIED BY 'admin' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql
    #echo "GRANT ALL ON *.* TO admin@'%' IDENTIFIED BY 'admin' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql

     
    #mysql -u root -padmin  < /opt/bucketlist.sql

    #killall mysqld
    #sleep 10s
### DONE OLD

fi

#/usr/bin/mysqld_safe &
