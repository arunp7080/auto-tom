From ubuntu
RUN apt-get update -y
RUN apt-get install -y nginx
EXPOSE 80
EXPOSE 443
