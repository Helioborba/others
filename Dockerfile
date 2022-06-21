FROM php:7.1.3

RUN apt-get update && apt-get install -y libmcrypt-dev \
    mysql-client libmagickwand-dev --no-install-recommends \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
&& docker-php-ext-install mcrypt pdo_mysql

# Install Composer
WORKDIR /server
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
COPY ./ ./

# need to move composer.phar to root folder (instead install it there actually)
# also, need apt-get install git
# you also gonna need to go into the composer folder and use composer update! dont forget this everytime you change the autoloader