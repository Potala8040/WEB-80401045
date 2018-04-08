#!/bin/bash
DIR_0001=/root/storage/files
DIR_0002=/root/storage/files
SQL_USER=root
SQL_PASS=haokewei
BAK_0001=$(date +"%Y%m%d%H")_
BAK_0002=$(date -d -10day +"%Y%m%d%H")_
BAK_0003=$(date -d -30day +"%Y%m%d%H")_
BAK_0004=SQL.gz
BAK_0005=SQL.tar.gz
cd $DIR_0001
for db in `/usr/local/mysql/bin/mysql -u$SQL_USER -p$SQL_PASS -B -N -e 'SHOW DATABASES' | xargs`; do
(/usr/local/mysql/bin/mysqldump -u$SQL_USER -p$SQL_PASS ${db} | gzip -9 - > ${db}.$BAK_0004)
done
tar zcf $DIR_0001/$BAK_0001$BAK_0005 $DIR_0001/*.$BAK_0004
rm -rf $DIR_0001/*.$BAK_0004
rm -rf $DIR_0001/$BAK_0002$BAK_0005
lftp ftp.cdn.qcloud.com -u 1251043285_profile03,haokeweiIII123 << EOF
mput $BAK_0001$BAK_0005
rm -rf $BAK_0003$BAK_0005
bye
EOF
