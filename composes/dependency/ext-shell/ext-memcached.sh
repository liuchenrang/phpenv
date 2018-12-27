apt-get install zlib1g-dev
mkdir -p /usr/local/src
cd /usr/local/src
wget  --no-check https://launchpad.net/libmemcached/1.0/1.0.18/+download/libmemcached-1.0.18.tar.gz
tar zxvf libmemcached-1.0.18.tar.gz
cd libmemcached-1.0.18
./configure --prefix=/usr/local/libmemcached --enable-sasl
make && make install

cd /usr/local/src
wget http://pecl.php.net/get/memcached-2.2.0.tgz
tar zxvf memcached-2.2.0.tgz
cd memcached-2.2.0

phpize
./configure --with-libmemcached-dir=/usr/local/libmemcached  --enable-memcached-sasl
make && make install