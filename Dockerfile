From ubuntu
RUN apt-get update -y
RUN apt-get install -y nginx python-pip apache2
EXPOSE 80
EXPOSE 443
