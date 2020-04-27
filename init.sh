#!/usr/bin/env bash
sn=2020`date +%Y%m%d%H%M%S`
srv=fx-service
publish(){
    ip=$1 
    mkdir -p $srv-project/versions
    historyNum=`ls -al $srv-project/versions/|grep $srv-|sort |awk '{print $9}'|awk -F- '{print $3}'|sort -g |wc -l`
    history=`ls -al $srv-project/versions|grep $srv-|sort |awk '{print $9}'|awk -F- '{print $3}'|sort -g`
    reserveNum=1
    removeNum=$(($historyNum-$reserveNum))
    if [[ "$removeNum" -gt 0 ]]; then
            history=`ls -al $srv-project/versions|grep $srv-|sort |awk '{print $9}'|awk -F- '{print $3}'|sort -g|head -n $removeNum`
            for i in $history; do
                    if [[ $i =~ "2020" ]]; then
                            rm -rf  $srv-project/versions/$srv-$i
                    fi
            done;
    fi
    rsync -avz $srv-project/$srv/ $srv-project/versions/$srv-$sn
    publishRemove $ip
} 
publishRemove(){
    ip=$1

    historyNum=`ssh root@$ip ls -al /var/www/html/|grep $srv-|sort |awk '{print $9}'|awk -F- '{print $3}'|sort -g |wc -l`
    history=`ssh root@$ip ls -al /var/www/html/|grep $srv-|sort |awk '{print $9}'|awk -F- '{print $3}'|sort -g`
    reserveNum=1
    removeNum=$(($historyNum-$reserveNum))
    if [[ "$removeNum" -gt 0 ]]; then
            history=`ssh root@$ip ls -al /var/www/html/|grep $srv-|sort |awk '{print $9}'|awk -F- '{print $3}'|sort -g|head -n $removeNum`
            for i in $history; do
                    if [[ $i =~ "2020" ]]; then
                           ssh root@$ip "rm -rf /var/www/html/$srv-$i"
                    fi
            done;
    fi
    rsync -avz $srv-project/versions/$srv-$sn/ root@$ip:/var/www/html/$srv

}
rolback(){
    version=$1
    ip=$2
    if [[ $version -gt 0 ]]; then 
        echo "do rollback version"
    else
        echo "please input version"
    fi
    rsync -avz $srv-project/versions/$srv-$version/ root@$ip:/var/www/html/$srv
}
versions(){
    history=`ls -al $srv-project/versions|grep $srv-|sort |awk '{print $9}'|awk -F- '{print $3}'|sort -g`
    echo $history
}
 
if [[ $# -eq 0 ]]; then
    echo "usage:"
    echo  "pub publish code \r\n"
    echo  "ls view version \r\n"
    echo  "rk rollback code -version \r\n"
fi
if [ "x$1" == "xpub" ]; then
    echo  "publish"
    for ip in `cat ip.txt`; do
       publish $ip
    done;
fi
if [ "x$1" == "xls" ]; then
    versions
fi
if [ "x$1" == "xrk" ]; then
    for ip in `cat ip.txt`; do
       rolback $2 $ip
    done;
fi
