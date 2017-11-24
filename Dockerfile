From arunpdevops/built-io:latest
RUN apt-get update -y
RUN apt-get install -y python-pip apache2
COPY index.html /var/www/html/
EXPOSE 80
EXPOSE 443
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
