# This Dockerfile is used to build an image containing basic stuff to be used as a Jenkins slave build node.
FROM ubuntu
MAINTAINER sppatel <sppatel@paypalcorp.com> 

# Make sure the package repository is up to date.
RUN apt-get update
RUN apt-get -y upgrade

# Install a basic SSH server
RUN apt-get install -y openssh-server

# Install JDK 7 (latest edition)
RUN apt-get install -y openjdk-7-jdk
Run apt-get install -y git wget
Run apt-get install -y nodejs npm

RUN npm install -g mocha
RUN ln -s /usr/bin/nodejs /usr/bin/node

# Setuo ssh
RUN mkdir -p /var/run/sshd
#RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd


# Add user jenkins to the image
RUN adduser --quiet jenkins
# Set password for the jenkins user (you may want to alter this).
RUN echo "jenkins:jenkins" | chpasswd

# Standard SSH port
EXPOSE 22

WORKDIR /home/jenkins

CMD ["/usr/sbin/sshd", "-D"]
