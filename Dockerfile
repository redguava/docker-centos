FROM centos

RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

RUN yum install -y supervisor
RUN mkdir /etc/supervisord.d/
ADD supervisord.conf /etc/supervisord.conf

