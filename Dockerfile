FROM centos

RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

ADD https://github.com/coreos/etcd/releases/download/v0.3.0/etcd-v0.3.0-linux-amd64.tar.gz /build
RUN cd /build && tar xzf etcd-v0.3.0-linux-amd64.tar.gz && mv /build/etcd-v0.3.0-linux-amd64/etcdctl /usr/local/bin/
RUN rm -rf build/

RUN yum install -y supervisor
RUN mkdir /etc/supervisord.d/
ADD supervisord.conf /etc/supervisord.conf

