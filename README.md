# phpenv
# 新增扩展
   - 需要重新build 单个service 测试 docker-compose build serviceName

```shell
#更新仓库
apt-get update 

ifconfig 

ping 
    apt-get install inetutils-ping
tcpdump 
    apt install tcpdump
pstack strace 
    apt install gdb
ps
    apt-get install --reinstall procps
#bash in service     
docker-compose exec  serviceName /bin/bash

```
# redis 管理工具
```shell
docker cp php-redis-admin:/var/www/html/php-redis-admin/app/config/config.php .
docker cp config.php php-redis-admin:/var/www/html/php-redis-admin/app/config/config.php
docker run --link workerenv_redis_1  -p 18080:80 -d --name php-redis-admin faktiva/php-redis-admin\n
```


/usr/local/lib/php/