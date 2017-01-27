FROM ubuntu:14.04

ADD /files /home/projectfiles

#
RUN apt-get update
RUN dpkg-reconfigure --frontend noninteractive tzdata
RUN export TZ=America/Sao_Paulo
RUN apt-get install -y language-pack-pt

# Install basics
RUN apt-get update
RUN apt-get install -y software-properties-common && \
    add-apt-repository ppa:ondrej/php && apt-get update
RUN apt-get install -y --force-yes curl git

# Install Apache2
RUN apt-get install apache2 -y

# Install MySQL
RUN apt-get install -y mysql-server mysql-client

# Install PHP 5.6
RUN apt-get install -y --allow-unauthenticated php5.6 php5.6-mhash php5.6-mcrypt php5.6-curl php5.6-cli php5.6-mysql php5.6-gd php5.6-intl php5.6-dev php-pear

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
