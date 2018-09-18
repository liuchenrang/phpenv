FROM php:5.6.38-fpm-stretch
LABEL maintainer="xinghuo"
ARG PHALCON_VERSION=1.3.4
ARG PHALCON_EXT_PATH=php5/64bits

RUN apt-get update \
    && apt-get install -y librabbitmq-dev  \
    && pecl install amqp-1.9.3  \
    && pecl install xdebug-2.5.5 \
    && pecl install redis-4.0.2 \
    && docker-php-ext-enable amqp xdebug redis

RUN set -xe && \
        # Compile Phalcon
        docker-php-ext-install pdo pdo_mysql && \
        curl -LO   https://github.com/phalcon/cphalcon/archive/phalcon-v1.3.4.tar.gz && \
        tar xzf ${PWD}/phalcon-v1.3.4.tar.gz && \
 
        base=${PWD} && \
        cd  ${PWD}/cphalcon-phalcon-v1.3.4/build && \
        echo "extension=phalcon.so" > /usr/local/etc/php/conf.d/docker-php-ext-phalcon.ini && \
        ./install && cd ${base} && \
        # Remove all temp files
        rm -r \
            ${PWD}/phalcon-v1.3.4.tar.gz \
            ${PWD}/cphalcon-phalcon-v1.3.4