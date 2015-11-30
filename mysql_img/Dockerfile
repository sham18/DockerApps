FROM ubuntu:latest

MAINTAINER  sppatel

# Install latest updates
RUN apt-get update
RUN apt-get upgrade -y

# Install mysql client and server
RUN apt-get -y install mysql-client mysql-server curl

# Enable remote access (default is localhost only, we change this
# otherwise our database would not be reachable from outside the container)
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
#RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf

# Install database
ADD files/bucketlist.sql /opt/

# Set Standard settings
ENV user admin
ENV password admin
ENV url file:/opt/bucketlist.sql
ENV right READ

# Install starting script
ADD files/startup.sh /opt/startup.sh
RUN chmod +x /opt/startup.sh

EXPOSE 3306

CMD ["/opt/startup.sh"]







#FROM ubuntu

#RUN dpkg-divert --local --rename --add /sbin/initctl
#RUN ln -s /bin/true /sbin/initctl

##RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
#RUN apt-get update

#RUN apt-get -y install mysql-client mysql-server
#RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

#ADD files/startup.sh files/bucketlist.sql /opt/
#EXPOSE 3306

#CMD ["/bin/bash", "/opt/startup.sh"]
