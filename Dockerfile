FROM centos:latest

RUN yum localinstall -y http://dl.fedoraproject.org/pub/epel/beta/7/x86_64/epel-release-7-0.2.noarch.rpm

RUN yum install -y git golang tar &&\
  git clone https://github.com/coreos/etcdctl /build &&\
  cd /build && ./build && mv /build/bin/etcdctl /usr/local/bin/ &&\
  rm -rf /build &&\
  yum clean all

RUN curl -L https://github.com/kelseyhightower/confd/releases/download/v0.6.0-alpha3/confd-0.6.0-alpha3-linux-amd64 -o /usr/local/bin/confd &&\
  chmod +x /usr/local/bin/confd && mkdir -p /etc/confd/{conf.d,templates} &&\
  rm -rf /build
