FROM ubuntu

RUN apt-get update

# Install basic applications
RUN apt-get install -y tar curl wget net-tools build-essential


# Install Python and Basic Python Tools
RUN apt-get install -y python python-dev python-distribute python-pip libmysqlclient-dev
RUN apt-get -y install mysql-client

ENV PATH /usr/bin:/usr/local/bin:$PATH
ENV mysql=/usr/bin/mysql
# Copy application foler inside container
RUN mkdir -p /x/opt/

ADD basic-webpy /x/opt/basic-webpy

#Get pip to download and install requirements
RUN pip install -r /x/opt/basic-webpy/requirements.txt

EXPOSE 5000

WORKDIR /x/opt/basic-webpy

CMD python app.py
