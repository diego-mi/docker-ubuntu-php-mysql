FROM ubuntu:14.04.4

ENV DEBIAN_FRONTEND=noninteractive

# Install basics

RUN apt-get update && apt-get install -y apt-transport-https
RUN apt-get install -y software-properties-common
RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
RUN apt-get update
RUN apt-get install -y --force-yes curl git apache2

# Install PHP 5.6
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --allow-unauthenticated php5.6 php5.6-mysql php5.6-mcrypt php5.6-cli php5.6-gd php5.6-curl

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
