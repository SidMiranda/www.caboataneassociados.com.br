# Use a lightweight image of Alpine Linux as the base image
FROM alpine:latest

# Update and install necessary packages
RUN apk update && apk upgrade && \
    apk add --no-cache apache2 php8-apache2 php8

# Copy the Apache configuration file to the container
COPY httpd.conf /etc/apache2/httpd.conf

# Expose port 80 for web traffic
EXPOSE 80

# Start Apache in the foreground when the container is started
CMD ["httpd", "-D", "FOREGROUND"]
