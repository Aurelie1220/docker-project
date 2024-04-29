FROM tomcat:latest

# Install dependencies
RUN apt update -y && \
    apt install -y httpd && \
    apt search wget && \
    apt install wget -y && \
    apt install unzip -y

# change directory
RUN cd /var/www/html
     && wget https://github.com/azeezsalu/techmax/archive/refs/heads/main.zip
     &&unzip main.zip
     && cp -r techmax-main/* /var/www/html/
     &&rm -rf techmax-main main.zip

# exposes port 8080 on the container
EXPOSE 8080

# set the default application that will start when the container start
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
