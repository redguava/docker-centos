FROM centos:latest

RUN yum localinstall -y http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-2.noarch.rpm

RUN yum install -y git golang tar &&\
  git clone https://github.com/coreos/etcdctl /build &&\
  cd /build && ./build && mv /build/bin/etcdctl /usr/local/bin/ &&\
  rm -rf /build &&\
  yum clean all

RUN curl -L https://github.com/kelseyhightower/confd/releases/download/v0.7.1/confd-0.7.1-linux-amd64 -o /usr/local/bin/confd &&\
  chmod +x /usr/local/bin/confd && mkdir -p /etc/confd/{conf.d,templates}
