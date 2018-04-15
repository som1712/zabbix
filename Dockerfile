From centos 
RUN yum update -y
RUN yum install -y fping net-tools nano wget unzip gcc libffi-devel python-devel openssl-devel redhat-rpm-config git epel-release python-pip -y
RUN mkdir -p /etc/zabbix && \ 
	mkdir -p /var/lib/zabbix && \ 
	mkdir -p /usr/lib/zabbix/alertscripts && \ 
	mkdir -p /var/lib/zabbix/enc && \ 
	mkdir -p /usr/lib/zabbix/externalscripts && \ 
	mkdir -p /var/lib/zabbix/mibs && \ 
	mkdir -p /var/lib/zabbix/modules && \ 
	mkdir -p /var/lib/zabbix/snmptraps && \ 
	mkdir -p /var/lib/zabbix/ssh_keys && \ 
	mkdir -p /var/lib/zabbix/ssl && \ 
	mkdir -p /var/lib/zabbix/ssl/certs && \ 
	mkdir -p /var/lib/zabbix/ssl/keys && \ 
	mkdir -p /var/lib/zabbix/ssl/ssl_ca && \ 
	mkdir -p /usr/share/doc/zabbix-server-mysql
#instala o repo e o zabbix
RUN rpm -ivh http://repo.zabbix.com/zabbix/3.4/rhel/7/x86_64/zabbix-release-3.4-2.el7.noarch.rpm && \
	yum install -y zabbix-server-mysql \ 
	OpenIPMI-libs \
        dejavu-sans-fonts \
        supervisor \
        unixODBC && \
        rm -f /etc/php-fpm.d/www.conf

EXPOSE 10051/TCP

WORKDIR /var/lib/zabbix

VOLUME ["/usr/lib/zabbix/alertscripts", "/usr/lib/zabbix/externalscripts", "/var/lib/zabbix/enc", "/var/lib/zabbix/mibs", "/var/lib/zabbix/modules"]
VOLUME ["/var/lib/zabbix/snmptraps", "/var/lib/zabbix/ssh_keys", "/var/lib/zabbix/ssl/certs", "/var/lib/zabbix/ssl/keys", "/var/lib/zabbix/ssl/ssl_ca"]
RUN yum clean all
