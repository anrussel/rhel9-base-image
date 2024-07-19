# Base RHEL9 image - Apache
FROM registry.redhat.io/rhel9/rhel-bootc:9.4

# Setup httpd
RUN dnf -y install httpd && \
    systemctl enable httpd && \
    mv /var/www /usr/share/www && \
    sed -ie 's,/var/www,/usr/share/www,' /etc/httpd/conf/httpd.conf
RUN rm /usr/share/httpd/noindex -rf
RUN echo "Welcome to RHEL Image Mode" > /usr/share/www/html/index.html

ARG rootpw
RUN echo "root:$rootpw" |chpasswd -e
