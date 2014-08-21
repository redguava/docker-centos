FROM centos

RUN yum localinstall -y http://dl.fedoraproject.org/pub/epel/beta/7/x86_64/epel-release-7-0.2.noarch.rpm

RUN yum install -y tar
RUN yum install -y git golang && git clone https://github.com/coreos/etcdctl /build && cd /build && ./build && mv /build/bin/etcdctl /usr/local/bin/
ADD https://github.com/kelseyhightower/confd/releases/download/v0.6.0-alpha3/confd-0.6.0-alpha3-linux-amd64 /build/
RUN cd /build && cp /build/confd-0.6.0-alpha3-linux-amd64 /usr/local/bin/confd && chmod +x /usr/local/bin/confd && mkdir -p /etc/confd/{conf.d,templates}
RUN rm -rf /build

RUN yum clean all

RUN useradd redguava
