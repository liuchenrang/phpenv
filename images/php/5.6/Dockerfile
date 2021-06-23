FROM php:5.6-fpm
LABEL maintainer="xinghuo"
RUN echo 1 \
    && apt-get update \
    && apt-get install -y libpng-dev  \
    && apt-get install -y inetutils-ping \  
    && apt-get install -y wget \   
    && apt-get install -y vim \   
    && apt-get install -y pstack \
    && apt-get install -y strace \
    && apt-get install -y --reinstall procps \
    && apt-get install -y librabbitmq-dev  \
    && pecl install amqp-1.9.3  \
    && pecl install xdebug-2.5.5 \
    && pecl install redis-4.0.2 \
    && docker-php-ext-enable amqp xdebug redis
RUN set -xe && \
        # Compile Phalcon
        docker-php-ext-install pdo pdo_mysql pcntl && \
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