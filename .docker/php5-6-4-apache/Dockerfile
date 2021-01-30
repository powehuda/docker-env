FROM php:5.6.40-apache

# COPY ./.docker/php5/php.ini /usr/local/etc/php/php.ini

# RUN apt-get update && apt-get install -y
        # libfreetype6-dev \
        # libjpeg62-turbo-dev \
        # libmcrypt-dev \
        #  mariadb-client --force-yes && rm -rf /var/lib/apt
#     && docker-php-ext-install pdo pdo_mysql zip \
#     && docker-php-ext-install -j$(nproc) iconv mcrypt \
#     && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
#     && docker-php-ext-install -j$(nproc) gd 
# RUN docker-php-ext-install php5-mysqlnd
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo pdo_mysql
RUN a2enmod rewrite
# RUN RUN docker-php-ext-enable mysqli 

EXPOSE 80