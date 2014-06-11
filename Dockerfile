FROM centos

RUN yum localinstall -y http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

RUN yum install -y tar
RUN yum install -y git golang && git clone https://github.com/coreos/etcdctl /build && cd /build && ./build && mv /build/bin/etcdctl /usr/local/bin/ && rm -rf /build

RUN yum clean all

