FROM centos

RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

RUN yum install -y git golang
RUN git clone https://github.com/coreos/etcdctl /build && cd /build && ./build && mv /build/bin/etcdctl /usr/local/bin/
RUN rm -rf build/ && yum remove -y git golang

RUN yum install -y supervisor
RUN mkdir /etc/supervisord.d/
ADD supervisord.conf /etc/supervisord.conf

