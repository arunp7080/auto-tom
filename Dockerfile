From ubuntu
RUN apt-get update -y
RUN apt-get install -y nginx python-pip
EXPOSE 80
EXPOSE 443
