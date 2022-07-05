# Originally written for Fedora-Dockerfiles by
#   scollier <scollier@redhat.com>
# Modified to run on RHEL and to add SSL Connection by Shah Zobair

FROM registry.access.redhat.com/rhel7
MAINTAINER Shah Zobair <szobair@redhat.com>

RUN groupadd postgres -g 1001 && \
    useradd postgres -u 1001 -g 1001

RUN yum --disablerepo='*' --enablerepo=rhel-7-server-rpms --enablerepo=rhel-7-server-extras-rpms update -y && \
    yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum --disablerepo='*' --enablerepo=epel --enablerepo=rhel-7-server-rpms --enablerepo=rhel-7-server-extras-rpms --enablerepo=rhel-7-server-optional-rpms install -y hostname net-tools postgresql-server postgresql postgresql-contrib supervisor pwgen openssl && yum clean all

ADD ./postgresql-setup /usr/bin/postgresql-setup
ADD ./supervisord.conf /etc/supervisord.conf

RUN chmod +x /usr/bin/postgresql-setup && \ 
    /usr/bin/postgresql-setup initdb && \
    mkdir /BACKUP && \
    cp -r /var/lib/pgsql/* /BACKUP/ && \
    rm -fr /var/lib/pgsql/*

COPY postgresql.conf db_entry.sh start_postgres.sh /

RUN chown -v postgres.postgres /postgresql.conf /db_entry.sh && \
    chmod -R 777 /var/lib/pgsql && \
    chmod 777 /start_postgres.sh && \
    chmod 660 /etc/passwd && \
    chmod 777 /etc /etc/pki/tls/certs /etc/pki/tls/private  && \
    chown -R postgres.postgres /BACKUP/* && \
    chmod -R 777 /BACKUP/ /var/run/postgresql/ /etc/pki/ca-trust/extracted/ /etc/pki/ca-trust/source/anchors/

EXPOSE 5432
USER 1001
COPY CERT/public-pgp.key /tmp/public-pgp.key

CMD ["/bin/bash", "/start_postgres.sh"]
