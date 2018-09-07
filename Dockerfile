FROM debian:stretch-slim
#FROM ubuntu:bionic

MAINTAINER Jan Oppolzer <jan@oppolzer.cz>

RUN apt-get -qq update && \
    apt-get -qq -y --no-install-recommends install \
        apache2 \
        libapache2-mod-shib2 && \
    rm -rf /var/lib/apt/lists/*

COPY files/apache-cert.pem \
     files/apache-chain.pem \
     /etc/ssl/certs/

COPY files/apache-key.pem \
     /etc/ssl/private/

COPY files/default-ssl.conf \
     /etc/apache2/sites-available/

RUN a2enmod ssl && \
    a2ensite default-ssl

COPY files/metadata-template.xml \
     files/sp-cert.pem \
     files/sp-key.pem \
     /etc/shibboleth/

COPY files/shibboleth2.xml \
     files/attribute-map.xml \
     /etc/shibboleth/

RUN cd /etc/shibboleth && \
    chown _shibd sp-*.pem && \
    chmod go= sp-key.pem

COPY files/shibd-apache2 \
     /usr/local/sbin/

EXPOSE 80 443

ENTRYPOINT ["shibd-apache2"]

