FROM dsabanin/deploybot-containers:ubuntu16-v1
MAINTAINER Ghislain Flandin <ghislain.flandin@gmail.com>

RUN apt-get update && apt-get -y install apt-utils curl openssl git
RUN apt-get -y install php7.0-mbstring php7.0-mcrypt php7.0-zip
RUN composer global require "squizlabs/php_codesniffer=*"
RUN composer global require "phpunit/phpunit=5.5.*"

# Node
RUN npm cache clean -f
RUN npm install -g n
RUN n stable
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get -y install yarn