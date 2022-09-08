FROM phpdockerio/php:8.1-fpm
WORKDIR /var/www/app

# Fix debconf warnings upon build
ARG DEBIAN_FRONTEND=noninteractive

# Install selected extensions and other stuff
RUN apt-get update \
    && apt-get -y --no-install-recommends install php8.1-memcached php8.1-mysql php8.1-gd php8.1-intl php8.1-redis php8.1-imagick \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Install node
RUN apt-get update \
    && curl -sL https://deb.nodesource.com/setup_14.x | bash  \
    && apt-get install -y nodejs && npm install -g npm \
    && node -v \
    && npm -v \
    && npm i npm@latest -g \
    && npm install pm2@latest -g

# confirm installation
RUN node -v
RUN npm -v

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install git
RUN apt-get update \
    && apt-get -y install git \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*