FROM php:7.2-apache

MAINTAINER "Nurhuda <powerhuda@gmail.com>"

WORKDIR /tmp

RUN usermod -u 1000 www-data

# RUN docker-php-source extract \
#     && apt-get -qq update && apt-get install -y \
#                               git zlib1g-dev \
#                               libfreetype6-dev \
#                               libjpeg62-turbo-dev \
#                               libmcrypt-dev \
# 							  mariadb-client && rm -rf /var/lib/apt \
# 	&& docker-php-ext-install pdo pdo_mysql zip \
# 	&& docker-php-ext-install -j$(nproc) iconv mcrypt \
# 	&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
# 	&& docker-php-ext-install -j$(nproc) gd \
# 	&& apt-get autoclean && apt-get autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
# 	&& docker-php-source delete

RUN yes | pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini

# Composer
# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html

# RUN useradd -ms /bin/bash admin
# RUN chown -R admin:admin /var/www/html
RUN mkdir -p /var/www/data/lib/php7/sessions
RUN chmod -R 777 /var/www/data/lib/php7/sessions
