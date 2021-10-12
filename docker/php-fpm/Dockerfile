FROM php:8.0-fpm

#>>> Installation des packages linux
# Requis:
# - libzip-dev: requis par composer
# - unzip: sinon, composer fera des warning tout moche
RUN apt-get update && apt-get install -y procps unzip libzip-dev
RUN pecl install xdebug-2.6.0
RUN docker-php-ext-enable xdebug
#RUN docker-php-ext-configure zip
#RUN docker-php-ext-install zip
#<<< Installation des packages linux

#>>> Installation de composer
# Télécharge les sources de composer v2 depuis l'image docker et les copies dans notre image.
COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

# Déclare la PATH de composer pour pouvoir utiliser la commande n'importe où.
ENV PATH="${PATH}:/root/.composer/vendor/bin"
#<<< Installation de composer
