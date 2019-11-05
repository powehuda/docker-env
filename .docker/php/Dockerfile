FROM php:7.1-apache

MAINTAINER "Nurhuda <powerhuda@gmail.com>"

WORKDIR /tmp

RUN usermod -u 1000 www-data

RUN docker-php-source extract \
    && apt-get -qq update && apt-get install -y \
                              git zlib1g-dev \
                              libfreetype6-dev \
                              libjpeg62-turbo-dev \
                              libmcrypt-dev \
							  mariadb-client && rm -rf /var/lib/apt \
	&& docker-php-ext-install pdo pdo_mysql zip \
	&& docker-php-ext-install -j$(nproc) iconv mcrypt \
	&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
	&& docker-php-ext-install -j$(nproc) gd \
	&& apt-get autoclean && apt-get autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
	&& docker-php-source delete

RUN yes | pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini

# Composer
# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Xdebug
RUN pecl install -o -f xdebug-2.4.0

ADD .docker/php/php-xdebug.ini /usr/local/etc/php/conf.d/php-xdebug.ini
RUN docker-php-ext-enable xdebug

COPY . /var/www/html
WORKDIR /var/www/html

# RUN useradd -ms /bin/bash admin
# RUN chown -R admin:admin /var/www/html
RUN mkdir -p /var/www/data/lib/php7/sessions
RUN chmod -R 777 /var/www/data/lib/php7/sessions

# Set permissions
# RUN chmod 0777 ./bootstrap/cache -R
# RUN chmod 0777 ./storage/* -R

# RUN cd /var/www/html && composer install -q --no-dev -o

# CMD ["php-fpm"]

## Add your application to the docker image
# ADD run.sh /run.sh

## Add the wait script to the image
# ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.5.0/wait /wait
# RUN chmod +x /wait

# CMD /wait && /run.sh && php-fpm 

# Add the wait-for-it script and use it for the process entrypoint
# ADD .docker/flarepoint-php/wait-for-it/wait-for-it.sh /wait-for-it.sh
# RUN chmod +x /wait-for-it.sh

# ENTRYPOINT [ "/wait-for-it.sh", "db:3306", "--" ]

# A command to simply test the connectivity to the database. Returns 0 if the connection succeeds
# CMD [ "nc", "-z", "db", "3306" ]