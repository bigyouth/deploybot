FROM dsabanin/deploybot-containers:ubuntu16-v1
MAINTAINER Ghislain Flandin <ghislain.flandin@gmail.com>

RUN composer global require "squizlabs/php_codesniffer=*"
RUN composer global require "phpunit/phpunit=5.5.*"

# Node
RUN npm cache clean -f
RUN npm install -g n
RUN n stable
RUN npm install -g eslint yarn