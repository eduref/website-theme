FROM php:7.2-apache

ENV APACHE_RUN_USER=www-data
ENV APACHE_RUN_GROUP=www-data

WORKDIR /usr/src/grav

# install missing dependencies
RUN apt-get update && apt-get install --no-install-recommends -y \
    git \
    wget \
    unzip \
    zlib1g \
    libwebp-dev \
    libjpeg-dev \
    libpng-dev \
    libz-dev \
    libxpm-dev \
    libfreetype6

# configure apache modules
RUN apt-get update && apt-get install -y \
    && docker-php-ext-install zip \
    && docker-php-ext-install gd \
    && a2enmod rewrite

# download and unpack grav
RUN wget -q https://getgrav.org/download/core/grav-admin/latest -O grav.zip  && \
    unzip -q grav.zip -d /var/www && \
    rm -rf /var/www/html && \
    mv /var/www/grav-admin /var/www/html

WORKDIR /var/www/html/

# remove default theme
# RUN rm -rf user/themes/antimatter && \
#    rm -rf user/pages

# copy custom theme
COPY clean-blog user/themes/clean-blog

# copy config and activate theme
COPY system.yaml user/config

# download content from repository
# RUN git clone https://github.com/eduref/website-content user/pages

# create admin user with username admin and password admin
COPY admin.yaml user/accounts

# set permission for www user
RUN chown -R www-data /var/www