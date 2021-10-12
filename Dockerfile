FROM php:8.0-fpm

#>>> Installation des packages linux
# Requis:
# - libzip-dev: requis par composer
# - unzip: sinon, composer fera des warning tout moche
# - nginx: le serveur web
# Optionels:
# - htop: pour check l'etat des daemons
# - zsh: meilleur shell
# - git: pour installer oh my zsh
# - vim: éditeur potable
RUN apt-get update && apt-get install -y htop nginx unzip libzip-dev zsh git vim
# Installation de oh my zsh.
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#RUN docker-php-ext-configure zip
#RUN docker-php-ext-install zip
#<<< Installation des packages linux

#>>> Installation de composer
# Télécharge les sources de composer v2 depuis l'image docker et les copies dans notre image.
COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

# Déclare la PATH de composer pour pouvoir utiliser la commande n'importe où.
ENV PATH="${PATH}:/root/.composer/vendor/bin"
#<<< Installation de composer
