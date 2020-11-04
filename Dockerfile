FROM registry.centos.org/centos
LABEL author="ivan prieto" \
      email="ivan.prieto@devoteam.com"
USER root
ENV ivan_env="valor variable1" \
    ivan_env1=" valor variable2"
RUN yum install -y httpd && \
    yum clean all && \
    useradd -r -m -s /bin/bash jaja -u 5900 

COPY index.html  /var/www/html
ADD index1.tar /var/www/html

RUN mkdir -p /compartir && \
    chown 5900:5900 /compartir && \
    chown 5900:5900 /home/jaja

EXPOSE ["80"]
VOLUME ["/compartir"]

USER root
WORKDIR /home/jaja

ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D","FOREGROUND"]


