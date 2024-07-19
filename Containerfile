# Base RHEL9 image - Apache
FROM registry.redhat.io/rhel9/rhel-bootc:9.4

RUN dnf install -y httpd && \
    dnf clean all
RUN systemctl enable httpd
RUN echo "Welcome to RHEL Image Mode" > /var/www/html/index.html


ARG rootpw
RUN echo "root:$rootpw" |chpasswd -e
