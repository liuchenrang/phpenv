FROM php:7.2-fpm
LABEL maintainer="xinghuo"
ARG PHALCON_VERSION=3.2.4
ARG PHALCON_EXT_PATH=php7/64bits
RUN  apt-get update \
    && apt-get install -y inetutils-ping \  
    && apt-get install -y wget \   
    && apt-get install -y vim \   
    && apt-get install -y pstack \
    && apt-get install -y strace \
    && apt-get install -y --reinstall procps \
    && apt-get install -y librabbitmq-dev \
    && pecl install xdebug-2.6.0 \
    && pecl install redis-4.1.0 \
    && docker-php-ext-enable  xdebug redis \
    && docker-php-ext-install pdo pdo_mysql pcntl 
RUN set -xe && \
        # Compile Phalcon
        curl -LO  --retry 3 https://github.com/phalcon/cphalcon/archive/v${PHALCON_VERSION}.tar.gz && \
        tar xzf ${PWD}/v${PHALCON_VERSION}.tar.gz 
RUN   cd ${PWD}/cphalcon-${PHALCON_VERSION}/build &&  ./install && \
        # Remove all temp files
        rm -rf \
            ${PWD}/v${PHALCON_VERSION}.tar.gz \
            ${PWD}/cphalcon-${PHALCON_VERSION}

