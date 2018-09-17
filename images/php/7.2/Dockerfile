FROM php:7.2-fpm
LABEL maintainer="xinghuo"
ARG PHALCON_VERSION=3.2.4
ARG PHALCON_EXT_PATH=php7/64bits

RUN  apt-get update \
    && apt-get install -y librabbitmq-dev \
    && pecl install amqp-1.9.3  \
    && pecl install xdebug-2.6.0 \
    && pecl install redis-4.1.0 \
    && docker-php-ext-enable amqp xdebug redis

RUN set -xe && \
        # Compile Phalcon
        curl -LO  --retry 3 https://github.com/phalcon/cphalcon/archive/v${PHALCON_VERSION}.tar.gz && \
        tar xzf ${PWD}/v${PHALCON_VERSION}.tar.gz && \
        docker-php-ext-install -j $(getconf _NPROCESSORS_ONLN) ${PWD}/cphalcon-${PHALCON_VERSION}/build/${PHALCON_EXT_PATH} && \
        # Remove all temp files
        rm -r \
            ${PWD}/v${PHALCON_VERSION}.tar.gz \
            ${PWD}/cphalcon-${PHALCON_VERSION}

