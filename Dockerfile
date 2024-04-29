FROM tomcat:latest

# Install dependencies
RUN apt-get update -y && \
    apt-get install -y wget unzip

# Change directory to /var/www/html
WORKDIR /var/www/html

# Download and extract the web application
RUN wget https://github.com/azeezsalu/techmax/archive/refs/heads/main.zip && \
    unzip main.zip && \
    cp -r techmax-main/* . && \
    rm -rf techmax-main main.zip

# Expose port 8080 on the container
EXPOSE 8080

# Set the default application that will start when the container starts
CMD ["catalina.sh", "run"]

