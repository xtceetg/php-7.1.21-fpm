FROM php:7.1.21-fpm
RUN apt-get update && apt-get install -y \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libpng-dev \
	&& docker-php-ext-install -j$(nproc) iconv \
	&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
	&& docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo_mysql mysqli zip \
    && docker-php-ext-enable pdo_mysql mysqli zip

# PECL extensions
RUN pecl install redis-4.0.1 \
    && docker-php-ext-enable redis