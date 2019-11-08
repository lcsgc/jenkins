FROM debian

MAINTAINER Lucas Correia

RUN apt-get update && apt-get install -y apache2 && apt-get clean

ENV APACHE_RUN_USER  www-data

ENV APACHE_RUN_GROUP www-data

ENV APACHE_LOG_DIR   /var/log/apache2

ENV APACHE_PID_FILE  /var/run/apache2/apache2.pid

ENV APACHE_RUN_DIR   /var/run/apache2

ENV APACHE_LOCK_DIR  /var/lock/apache2

ENV APACHE_DIR /var/www/html

RUN mkdir -p $APACHE_RUN_DIR

RUN mkdir -p $APACHE_LOCK_DIR

RUN mkdir -p $APACHE_LOG_DIR

COPY index.html ${APACHE_DIR}

RUN chown -R ${APACHE_RUN_USER} ${APACHE_DIR}

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
