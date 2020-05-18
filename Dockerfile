FROM centos:7

RUN curl -sL https://rpm.nodesource.com/setup_10.x | bash -

RUN yum -y install libaio libnsl nodejs wget unzip

RUN wget https://download.oracle.com/otn_software/linux/instantclient/193000/instantclient-basic-linux.x64-19.3.0.0.0dbru.zip && \
    unzip instantclient-basic-linux.x64-19.3.0.0.0dbru.zip && \
    cp -r instantclient_19_3/* /lib && \
    rm -rf instantclient-basic-linux.x64-19.3.0.0.0dbru.zip

ENV LD_LIBRARY_PATH=/instantclient_19_3

WORKDIR /code
