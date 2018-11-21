zlib1g-dev
apt install libmemcached-dev
pecl download memcached-3.0.4.tgz 
tar xvzf memcached-3.0.4.tgz 
cd memcached-3.0.4 && phpize && ./configure && make && make install
echo "extension=memcached.so" >  /usr/local/etc/php/conf.d/docker-php-ext-memcached.ini
