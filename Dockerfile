FROM ubuntu:16.10
MAINTAINER Ghislain Flandin <ghislain.flandin@gmail.com>
RUN apt-get update && apt-get -y install apt-utils curl openssl git

# PHP
RUN apt-get -y install php7.0 php7.0-xml php7.0-curl php7.0-mbstring php7.0-mcrypt php7.0-zip
ENV COMPOSER_BIN_DIR /usr/bin
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer global require "squizlabs/php_codesniffer=*"
RUN composer global require "phpunit/phpunit=5.5.*"

# Node
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get -y install nodejs
RUN npm install -g eslint sass-lint node-sass gulp-cli grunt-cli yarn bower
RUN echo '{ "allow_root": true }' > /root/.bowerrc
RUN npm rebuild node-sass