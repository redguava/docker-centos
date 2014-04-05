FROM centos

RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

RUN yum install -y git golang && git clone https://github.com/coreos/etcdctl /build && cd /build && ./build && mv /build/bin/etcdctl /usr/local/bin/ && rm -rf /build && yum remove -y git golang

RUN yum install -y python-pip

RUN pip install supervisor
RUN mkdir /etc/supervisord.d/
ADD supervisord.conf /etc/supervisord.conf

RUN yum clean all

